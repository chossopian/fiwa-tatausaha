import { createClient } from '@supabase/supabase-js';

/**
 * PUBLIC CLIENT (Anon Key)
 * ==========================================
 * Aman dipakai di halaman publik (homepage, gallery, staff directory, dll)
 * Aksesnya dibatasi oleh Row Level Security (RLS) di Supabase.
 * Bisa dipakai di client-side maupun server-side.
 */
export const supabase = createClient(
  import.meta.env.PUBLIC_SUPABASE_URL,
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY
);

/**
 * ADMIN CLIENT (Service Role Key)
 * ==========================================
 * ⚠️  RAHASIA — hanya boleh dipakai di server-side (file .astro dengan
 *     `export const prerender = false`, atau di dalam middleware/API routes).
 * ⚠️  JANGAN PERNAH import file ini di komponen/script yang jalan di browser.
 *
 * Key ini bypass semua RLS, jadi punya akses penuh baca/tulis/hapus semua data.
 * Dipakai khusus untuk halaman /admin/* (dashboard tata usaha).
 */
export function createAdminClient() {
  const serviceRoleKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!serviceRoleKey) {
    throw new Error(
      'SUPABASE_SERVICE_ROLE_KEY tidak ditemukan. Pastikan sudah diset di environment variables.'
    );
  }

  return createClient(import.meta.env.PUBLIC_SUPABASE_URL, serviceRoleKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}
