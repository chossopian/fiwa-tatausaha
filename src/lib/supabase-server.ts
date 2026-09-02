import { createServerClient as createSupabaseServerClient } from '@supabase/ssr';
import type { AstroCookies } from 'astro';

/**
 * SERVER CLIENT (session-aware, dipakai di middleware & halaman admin)
 * ==========================================
 * Client ini terintegrasi dengan cookies Astro, jadi bisa baca/tulis
 * session login user secara otomatis di server-side (SSR).
 *
 * Dipakai di:
 * - src/middleware.ts (cek apakah user sudah login)
 * - src/pages/admin/login.astro (proses sign in)
 * - Halaman admin lain yang butuh tahu siapa user yang login
 */
export function createServerClient(request: Request, cookies: AstroCookies) {
  return createSupabaseServerClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        getAll() {
          const cookieHeader = request.headers.get('cookie') ?? '';
          return cookieHeader
            .split(';')
            .map((part) => part.trim())
            .filter(Boolean)
            .map((part) => {
              const idx = part.indexOf('=');
              return {
                name: decodeURIComponent(part.slice(0, idx)),
                value: decodeURIComponent(part.slice(idx + 1)),
              };
            });
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => {
            cookies.set(name, value, { ...options, path: '/' });
          });
        },
      },
    }
  );
}
