import { defineMiddleware } from 'astro:middleware';
import { createServerClient } from './lib/supabase-server';
import { isEmailAllowed } from './lib/admin-auth';

export const onRequest = defineMiddleware(async (context, next) => {
  const { url, cookies, redirect, request } = context;

  // Middleware ini hanya berlaku untuk route /admin/*
  const isAdminRoute = url.pathname.startsWith('/admin');

  if (!isAdminRoute) {
    return next();
  }

  // Route-route berikut harus bisa diakses TANPA session dulu:
  // - /admin/login       -> halaman untuk mulai login
  // - /admin/auth/google -> memulai OAuth flow ke Google
  // - /admin/callback    -> menerima balikan dari Google & membuat session
  const isPublicAdminRoute =
    url.pathname === '/admin/login' ||
    url.pathname === '/admin/auth/google' ||
    url.pathname === '/admin/callback';

  const supabase = createServerClient(request, cookies);
  const { data } = await supabase.auth.getUser();

  // ⚠️ Defense-in-depth: walaupun sudah login via Google, tetap wajib
  // ada di whitelist. Ini jaga-jaga kalau ada bug/race-condition di flow
  // callback yang somehow membuat session lolos tanpa lewat pengecekan.
  const isLoggedIn = !!data.user && isEmailAllowed(data.user.email);

  if (isPublicAdminRoute) {
    // Kalau sudah login dan coba akses /admin/login lagi, lempar ke dashboard
    if (url.pathname === '/admin/login' && isLoggedIn) {
      return redirect('/admin');
    }
    return next();
  }

  // Semua route /admin/* lainnya WAJIB login & WAJIB ada di whitelist
  if (!isLoggedIn) {
    return redirect('/admin/login');
  }

  // Simpan info user ke context.locals biar bisa dipakai di halaman .astro
  context.locals.user = data.user;

  return next();
});
