import type { APIRoute } from 'astro';
import { createServerClient } from '../../lib/supabase-server';
import { isEmailAllowed } from '../../lib/admin-auth';

export const prerender = false;

/**
 * Endpoint ini dipanggil otomatis oleh Google/Supabase setelah user approve
 * login di halaman consent Google. Tugasnya:
 * 1. Tukar `code` dari Google jadi session Supabase (login resmi)
 * 2. Cek apakah email yang login ada di whitelist admin
 * 3. Kalau TIDAK ada di whitelist -> langsung sign out & tolak akses
 * 4. Kalau ada -> lanjut ke dashboard
 */
export const GET: APIRoute = async ({ request, cookies, redirect, url }) => {
  const code = url.searchParams.get('code');

  if (!code) {
    return redirect('/admin/login?error=missing_code');
  }

  const supabase = createServerClient(request, cookies);
  const { data, error } = await supabase.auth.exchangeCodeForSession(code);

  if (error || !data.user) {
    return redirect('/admin/login?error=auth_failed');
  }

  // ⚠️ INI BAGIAN KEAMANAN PALING PENTING ⚠️
  // Google cuma konfirmasi "siapa" user-nya, BUKAN "apakah dia boleh akses admin".
  // Makanya wajib dicek manual ke whitelist di sini.
  if (!isEmailAllowed(data.user.email)) {
    await supabase.auth.signOut();
    return redirect('/admin/login?error=not_authorized');
  }

  return redirect('/admin');
};
