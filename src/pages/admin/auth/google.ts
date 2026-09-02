import type { APIRoute } from 'astro';
import { createServerClient } from '../../../lib/supabase-server';

export const prerender = false;

/**
 * Endpoint ini dipanggil saat user klik tombol "Login dengan Google"
 * di halaman /admin/login. Tugasnya minta URL redirect OAuth dari Supabase,
 * lalu redirect browser user ke halaman consent Google.
 */
export const GET: APIRoute = async ({ request, cookies, redirect, url }) => {
  const supabase = createServerClient(request, cookies);

  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      // Setelah user approve di Google, dia akan dibalikkan ke endpoint callback ini
      redirectTo: `${url.origin}/admin/callback`,
    },
  });

  if (error || !data.url) {
    return redirect('/admin/login?error=oauth_init_failed');
  }

  return redirect(data.url);
};
