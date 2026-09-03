-- ==========================================
-- FIWA TATA USAHA — INITIAL SCHEMA
-- ==========================================
-- Konvensi:
-- - Primary key pakai UUID (tidak mudah ditebak/diurutkan)
-- - snake_case untuk semua nama tabel & kolom
-- - Setiap tabel punya created_at & updated_at (auto-update via trigger)
-- - RLS AKTIF di semua tabel (default deny, dibuka lewat policy eksplisit)
-- ==========================================

-- ==========================================
-- HELPER: trigger function untuk auto-update kolom updated_at
-- ==========================================
create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

-- ==========================================================
-- KELOMPOK A — KONTEN PUBLIK
-- (boleh dibaca publik lewat anon key, hanya admin yang bisa tulis)
-- ==========================================================

-- ==========================================
-- TABEL: staff
-- ==========================================
create table staff (
  id                     uuid primary key default gen_random_uuid(),
  employee_id            text,                 -- NIP
  full_name              text not null,
  title                  text,                  -- Gelar (Dr., M.Pd.I, dst)
  gender                 text,                  -- 'Laki-laki' / 'Perempuan'
  join_date              date,
  birth_place            text,
  birth_date             date,
  department             text,
  division               text,
  position               text,                  -- Jabatan
  last_education         text,                  -- S1/S2/S3
  education_institution  text,
  major                  text,
  phone                  text,
  email                  text,
  marital_status         text,
  photo_url              text,
  display_order          int default 0,
  status                 text not null default 'active',  -- active / inactive
  created_at             timestamptz not null default now(),
  updated_at             timestamptz not null default now()
);

create trigger trg_staff_updated_at
  before update on staff
  for each row execute function set_updated_at();

create index idx_staff_status on staff (status);

-- ==========================================
-- TABEL: announcements
-- ==========================================
create table announcements (
  id                 uuid primary key default gen_random_uuid(),
  title               text not null,
  category            text,
  announcement_date   date,
  description          text,
  image_url            text,
  link_url             text,
  is_featured          boolean not null default false,
  status               text not null default 'active',
  created_at           timestamptz not null default now(),
  updated_at           timestamptz not null default now()
);

create trigger trg_announcements_updated_at
  before update on announcements
  for each row execute function set_updated_at();

create index idx_announcements_status on announcements (status);

-- ==========================================
-- TABEL: academic_calendar
-- ==========================================
create table academic_calendar (
  id             uuid primary key default gen_random_uuid(),
  start_date      date not null,
  end_date        date,
  title           text not null,
  category        text,
  description     text,
  location        text,
  level           text,               -- All / SMP / SMA
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_academic_calendar_updated_at
  before update on academic_calendar
  for each row execute function set_updated_at();

create index idx_academic_calendar_status on academic_calendar (status);

-- ==========================================
-- TABEL: policies
-- ==========================================
create table policies (
  id             uuid primary key default gen_random_uuid(),
  title           text not null,
  category        text,
  description     text,
  file_url        text,
  last_updated    date,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_policies_updated_at
  before update on policies
  for each row execute function set_updated_at();

create index idx_policies_status on policies (status);

-- ==========================================
-- TABEL: canteen_menu
-- ==========================================
create table canteen_menu (
  id             uuid primary key default gen_random_uuid(),
  menu_date       date not null,
  day_name        text,
  breakfast       text,
  lunch           text,
  dinner          text,
  notes           text,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_canteen_menu_updated_at
  before update on canteen_menu
  for each row execute function set_updated_at();

create index idx_canteen_menu_status on canteen_menu (status);
create index idx_canteen_menu_date on canteen_menu (menu_date);

-- ==========================================
-- TABEL: circular_letters
-- ==========================================
create table circular_letters (
  id             uuid primary key default gen_random_uuid(),
  letter_date     date,
  title           text not null,
  category        text,
  description     text,
  file_url        text,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_circular_letters_updated_at
  before update on circular_letters
  for each row execute function set_updated_at();

create index idx_circular_letters_status on circular_letters (status);

-- ==========================================
-- TABEL: surveys
-- ==========================================
create table surveys (
  id             uuid primary key default gen_random_uuid(),
  title           text not null,
  description     text,
  deadline        date,
  survey_url      text,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_surveys_updated_at
  before update on surveys
  for each row execute function set_updated_at();

create index idx_surveys_status on surveys (status);

-- ==========================================
-- TABEL: timetable
-- ==========================================
create table timetable (
  id             uuid primary key default gen_random_uuid(),
  day_name        text not null,
  grade_name      text,               -- misal "Grade 10-A"
  period          text,
  time_range      text,
  subject         text,
  teacher_name    text,
  room            text,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_timetable_updated_at
  before update on timetable
  for each row execute function set_updated_at();

create index idx_timetable_status on timetable (status);

-- ==========================================
-- TABEL: career_opportunities
-- ==========================================
create table career_opportunities (
  id             uuid primary key default gen_random_uuid(),
  title           text not null,
  category        text,
  description     text,
  opportunity_date date,
  link_url        text,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_career_opportunities_updated_at
  before update on career_opportunities
  for each row execute function set_updated_at();

create index idx_career_opportunities_status on career_opportunities (status);

-- ==========================================
-- TABEL: elibrary
-- ==========================================
create table elibrary (
  id             uuid primary key default gen_random_uuid(),
  title           text not null,
  author          text,
  category        text,
  cover_url       text,
  description     text,
  resource_url    text,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_elibrary_updated_at
  before update on elibrary
  for each row execute function set_updated_at();

create index idx_elibrary_status on elibrary (status);

-- ==========================================
-- TABEL: gallery
-- ==========================================
create table gallery (
  id             uuid primary key default gen_random_uuid(),
  title           text not null,
  category        text,
  description     text,
  image_url       text,
  gallery_date    date,
  status          text not null default 'active',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create trigger trg_gallery_updated_at
  before update on gallery
  for each row execute function set_updated_at();

create index idx_gallery_status on gallery (status);

-- ==========================================================
-- KELOMPOK B — DATA SENSITIF
-- (TIDAK ADA akses publik sama sekali, hanya lewat service_role
-- di halaman /admin/* server-side)
-- ==========================================================

-- ==========================================
-- TABEL: students
-- ==========================================
create table students (
  id                 uuid primary key default gen_random_uuid(),
  student_id          text not null unique,   -- "2425.07.052"
  nisn                text,
  email               text,
  full_name           text not null,
  nickname            text,
  arabic_name         text,
  gender              text,                    -- 'Ikhwan' / 'Akhwat'
  nik                 text,
  birth_place         text,
  birth_date          date,
  nationality         text,
  photo_url           text,

  -- akademik
  class_name          text,                    -- "9D"
  room                text,                    -- "B.2.20"
  level               text,                    -- SMP / SMA
  grade               int,                     -- 7,8,9,10,11,12
  tahfidz_program     text,
  pathway             text,
  elective_subjects   text,                    -- disimpan sebagai comma-separated / JSON text sederhana
  target_university   text,

  -- data ayah
  father_name         text,
  father_phone        text,
  father_email        text,
  father_occupation   text,

  -- data ibu
  mother_name         text,
  mother_phone        text,
  mother_email        text,
  mother_occupation   text,

  -- alamat domisili
  country             text,
  address             text,

  status              text not null default 'active',  -- active / alumni / inactive
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);

create trigger trg_students_updated_at
  before update on students
  for each row execute function set_updated_at();

create index idx_students_status on students (status);
create index idx_students_class on students (class_name);

-- ==========================================
-- TABEL: student_mentors (relasi many-to-many: santri <-> staf)
-- ==========================================
create table student_mentors (
  id             uuid primary key default gen_random_uuid(),
  student_id      uuid not null references students(id) on delete cascade,
  staff_id        uuid not null references staff(id) on delete cascade,
  mentor_role     text,      -- misal "Mentor Akademik", "Mentor Tahfidz"
  created_at      timestamptz not null default now(),

  unique (student_id, staff_id, mentor_role)
);

create index idx_student_mentors_student on student_mentors (student_id);
create index idx_student_mentors_staff on student_mentors (staff_id);

-- ==========================================
-- TABEL: alumni
-- ==========================================
-- Menampung alumni SMP (lanjut ke SMA) MAUPUN alumni SMA (lanjut kuliah/kerja).
-- student_id di sini SELALU match dengan students.student_id (nomor induk
-- tidak berubah walau statusnya sudah jadi alumni).
create table alumni (
  id                              uuid primary key default gen_random_uuid(),
  student_id                      text not null,     -- match ke students.student_id
  nisn                            text,
  full_name                       text not null,
  graduation_level                text not null,     -- 'SMP' / 'SMA' (jenjang saat lulus dari FIWA)
  graduation_year                 int not null,       -- tahun lulus, misal 2026

  -- tujuan lanjutan setelah lulus
  continued_type                  text,               -- 'SMA FIWA' / 'SMA Non FIWA' / 'Kuliah' / 'Kerja' / 'Lainnya'
  continued_institution_name      text,                -- nama SMA/universitas/perusahaan tujuan
  country                          text,

  -- dokumen (link ke Google Drive / Supabase Storage)
  ijazah_dinas_url                 text,
  transkrip_internal_english_url   text,
  ijazah_internal_english_url      text,
  transkrip_internal_arabic_url    text,
  ijazah_internal_arabic_url       text,

  status                           text not null default 'active',
  created_at                       timestamptz not null default now(),
  updated_at                       timestamptz not null default now()
);

create trigger trg_alumni_updated_at
  before update on alumni
  for each row execute function set_updated_at();

create index idx_alumni_student_id on alumni (student_id);
create index idx_alumni_graduation_year on alumni (graduation_year);

-- ==========================================================
-- ROW LEVEL SECURITY (RLS)
-- ==========================================================
-- Prinsip:
-- - Kelompok A (publik): anon boleh SELECT baris dengan status='active'.
--   INSERT/UPDATE/DELETE tidak ada policy untuk anon -> otomatis ditolak.
--   service_role (dipakai di halaman admin) selalu bypass RLS.
-- - Kelompok B (sensitif): TIDAK ADA policy untuk anon sama sekali.
--   Hanya service_role yang bisa akses (lewat halaman /admin/*).

-- ---------- KELOMPOK A: aktifkan RLS + policy baca publik ----------

alter table staff enable row level security;
create policy "Public can read active staff"
  on staff for select
  to anon
  using (status = 'active');

alter table announcements enable row level security;
create policy "Public can read active announcements"
  on announcements for select
  to anon
  using (status = 'active');

alter table academic_calendar enable row level security;
create policy "Public can read active academic_calendar"
  on academic_calendar for select
  to anon
  using (status = 'active');

alter table policies enable row level security;
create policy "Public can read active policies"
  on policies for select
  to anon
  using (status = 'active');

alter table canteen_menu enable row level security;
create policy "Public can read active canteen_menu"
  on canteen_menu for select
  to anon
  using (status = 'active');

alter table circular_letters enable row level security;
create policy "Public can read active circular_letters"
  on circular_letters for select
  to anon
  using (status = 'active');

alter table surveys enable row level security;
create policy "Public can read active surveys"
  on surveys for select
  to anon
  using (status = 'active');

alter table timetable enable row level security;
create policy "Public can read active timetable"
  on timetable for select
  to anon
  using (status = 'active');

alter table career_opportunities enable row level security;
create policy "Public can read active career_opportunities"
  on career_opportunities for select
  to anon
  using (status = 'active');

alter table elibrary enable row level security;
create policy "Public can read active elibrary"
  on elibrary for select
  to anon
  using (status = 'active');

alter table gallery enable row level security;
create policy "Public can read active gallery"
  on gallery for select
  to anon
  using (status = 'active');

-- ---------- KELOMPOK B: aktifkan RLS, TANPA policy apapun ----------
-- (RLS aktif + tidak ada policy = SEMUA akses via anon/authenticated
-- ditolak total. Hanya service_role yang bisa tembus, karena
-- service_role secara desain selalu bypass RLS di PostgREST/Supabase.)

alter table students enable row level security;
alter table student_mentors enable row level security;
alter table alumni enable row level security;