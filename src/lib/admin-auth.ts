/**
 * WHITELIST EMAIL ADMIN
 * ==========================================
 * Karena login memakai Google OAuth, secara default SIAPA SAJA yang punya
 * akun Google bisa login. Ini berbahaya untuk dashboard admin yang isinya
 * data sensitif (siswa, karyawan, dll).
 *
 * Fungsi ini mengecek apakah email yang login ada di dalam daftar email
 * yang diizinkan (di-set lewat environment variable ADMIN_ALLOWED_EMAILS,
 * dipisah dengan koma).
 *
 * Contoh isi env: ADMIN_ALLOWED_EMAILS=tu1@gmail.com,tu2@gmail.com
 *
 * Catatan: untuk tahap awal ini cukup simpel (env variable). Kalau nanti
 * daftar admin makin banyak/sering berubah, bisa di-upgrade jadi tabel
 * `admin_users` di Supabase.
 */
export function isEmailAllowed(email: string | null | undefined): boolean {
  if (!email) return false;

  const allowedEmailsRaw = import.meta.env.ADMIN_ALLOWED_EMAILS ?? '';
  const allowedEmails = allowedEmailsRaw
    .split(',')
    .map((e) => e.trim().toLowerCase())
    .filter(Boolean);

  return allowedEmails.includes(email.toLowerCase());
}