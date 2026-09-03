-- ==========================================
-- SEED DATA — FIWA TATA USAHA
-- ==========================================
-- Data awal dipindahkan dari sistem lama (Google Apps Script + Spreadsheet).
-- Jalankan file ini SETELAH migration 0001_init_schema.sql berhasil.
-- ==========================================

-- ==========================================
-- STAFF
-- ==========================================
insert into staff
  (employee_id, full_name, title, gender, join_date, birth_place, birth_date, department, division, position, last_education, education_institution, major, phone, email, marital_status, photo_url, display_order, status)
values
  ('19850101201501', 'Ahmad Fauzi', 'Dr., M.Pd.I', 'Laki-laki', '2015-08-01', 'Jakarta', '1985-01-01', 'Management', 'Academic', 'Principal', 'S3', 'Universitas Islam Negeri', 'Pendidikan Islam', '08123456789', 'ahmad.fauzi@fiwa.sch.id', 'Menikah', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=500&fit=crop', 1, 'active'),
  ('19880202201602', 'Hamzah Yusuf', 'Lc., M.Ag', 'Laki-laki', '2016-09-01', 'Surabaya', '1988-02-02', 'Tahfidz & Religion', 'Academic', 'Head of Islamic Studies', 'S2', 'Universitas Madinah', 'Tafsir Hadits', '08129876543', 'hamzah.yusuf@fiwa.sch.id', 'Menikah', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400&h=500&fit=crop', 2, 'active'),
  ('19920303201803', 'Sarah Jenkins', 'M.Ed.', 'Perempuan', '2018-07-15', 'London', '1992-03-03', 'English Department', 'Academic', 'Senior Language Lecturer', 'S2', 'University of Cambridge', 'English Education', '08134567890', 'sarah.j@fiwa.sch.id', 'Belum Menikah', 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&h=500&fit=crop', 3, 'active');

-- ==========================================
-- POLICIES
-- ==========================================
insert into policies
  (title, category, description, file_url, last_updated, status)
values
  ('Student Code of Conduct & Morality Handbook', 'Student', 'Rules governing daily behavior, Islamic manners, and dress codes.', 'https://example.com/handbook', '2026-01-10', 'active'),
  ('Assessment & Academic Integrity Policy', 'Academic', 'Official grading rules, standard protocols, and plagiarism policies.', 'https://example.com/integrity', '2026-02-15', 'active');

-- ==========================================
-- CANTEEN MENU
-- ==========================================
insert into canteen_menu
  (menu_date, day_name, breakfast, lunch, dinner, notes, status)
values
  ('2026-03-02', 'Monday', 'Nasi Uduk Komplit, Telur Balado, Tempe Orek & Kerupuk', 'Nasi Putih, Rendang Daging Sapi, Sayur Kapau & Buah Pisang', 'Soto Ayam Lamongan, Nasi Putih, Kerupuk & Semangka Segar', 'Menu tinggi protein & serat alami.', 'active'),
  ('2026-03-03', 'Tuesday', 'Pancake Madu Habbatussauda, Telur Rebus & Susu Kurma', 'Nasi Putih, Ayam Bakar Bumbu Rujak, Sayur Asem & Jeruk', 'Sup Ikan Kakap Kuah Asam Segar, Nasi Putih & Melon', 'Menu rendah lemak jenuh untuk stamina belajar.', 'active'),
  ('2026-03-04', 'Wednesday', 'Nasi Goreng Kampung Spesial, Telur Dadar & Mentimun', 'Nasi Putih, Ikan Gurame Bakar Kecap, Cah Kangkung & Pepaya', 'Daging Sapi Lada Hitam, Nasi Putih, Sayur Buncis & Pisang', 'Asupan omega-3 dan zat besi optimal.', 'active'),
  ('2026-03-05', 'Thursday', 'Bubur Ayam Komplit, Telur Rebus & Kacang Almond', 'Nasi Putih, Ayam Goreng Lengkuas, Sayur Lodeh & Buah Apel', 'Rawon Daging Sapi, Tauge Pendek, Telur Asin & Sambal', 'Menu kaya rempah tradisional Indonesia.', 'active'),
  ('2026-03-06', 'Friday', 'Roti Gandum Panggang, Scrambled Eggs & Keju Cheddar', 'Nasi Kebuli Daging Kambing Muda, Acar Segar & Kurma Ajwa', 'Sup Bakso Sapi Tahu, Nasi Putih, Sayur Sawi & Jeruk Manis', 'Spesial menu Jumat berkah bergizi tinggi.', 'active'),
  ('2026-03-07', 'Saturday', 'Lontong Sayur Betawi, Telur Puyuh & Sambal Goreng', 'Nasi Putih, Daging Teriyaki Wijen, Salad Sayur Segar & Buah Pir', 'Mie Ayam Jamur Herbal, Pangsit Rebus & Buah Naga', 'Variasi menu akhir pekan bergizi seimbang.', 'active'),
  ('2026-03-08', 'Sunday', 'Nasi Kuning Harum, Abon Sapi, Perkedel & Telur Suwir', 'Nasi Putih, Ikan Fillet Asam Manis, Cah Brokoli & Semangka', 'Ayam Panggang Klaten, Nasi Putih, Sayur Sop Bening & Pisang', 'Persiapan energi menyambut pekan belajar baru.', 'active');

-- ==========================================
-- CIRCULAR LETTERS
-- ==========================================
insert into circular_letters
  (letter_date, title, category, description, file_url, status)
values
  ('2026-02-28', 'Invitation to PTA Progress Review Conference', 'General', 'Official invitation card for parents to discuss quarterly academic developments.', 'https://example.com/pta-circular', 'active');

-- ==========================================
-- SURVEYS
-- ==========================================
insert into surveys
  (title, description, deadline, survey_url, status)
values
  ('Canteen Quality Feedback Survey Q1 2026', 'Please evaluate the meals, hygiene, and service of our school cafeteria.', '2026-04-30', 'https://forms.gle/sample', 'active'),
  ('Extracurricular Program Quality Evaluation', 'Feedback regarding current extracurricular offerings.', '2026-01-01', 'https://forms.gle/sample', 'active');

-- ==========================================
-- TIMETABLE
-- ==========================================
insert into timetable
  (day_name, grade_name, period, time_range, subject, teacher_name, room, status)
values
  ('Monday', 'Grade 10-A', 'Period 1', '07:30 - 08:30', 'Islamic History', 'Ustadz Hamzah', 'Room 101', 'active'),
  ('Monday', 'Grade 10-A', 'Period 2', '08:30 - 09:30', 'Calculus', 'Mr. Budi', 'Room 101', 'active'),
  ('Tuesday', 'Grade 10-A', 'Period 1', '07:30 - 08:30', 'Chemistry Lab', 'Mrs. Ani', 'Science Lab A', 'active');

-- ==========================================
-- CAREER OPPORTUNITIES
-- ==========================================
insert into career_opportunities
  (title, category, description, opportunity_date, link_url, status)
values
  ('Full Scholarship Opportunities - Madinah Islamic University', 'Scholarship', 'Fully funded opportunities for senior school graduates studying religious fields.', '2026-02-22', 'https://example.com/scholarship', 'active');

-- ==========================================
-- E-LIBRARY
-- ==========================================
insert into elibrary
  (title, author, category, cover_url, description, resource_url, status)
values
  ('The Sealed Nectar (Ar-Raheeq Al-Makhtum)', 'Safiur Rahman Al-Mubarakpuri', 'Islamic History', 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=300&auto=format&fit=crop', 'A detailed, authentic biography of the Prophet Muhammad (PBUH).', 'https://example.com/sealed-nectar', 'active'),
  ('Introduction to Arabic Grammar', 'Dr. Muhammad Ibrahim', 'Language', 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=300&auto=format&fit=crop', 'Comprehensive introductory material on Arabic letters, syntax and rules.', 'https://example.com/grammar-arabic', 'active');

-- ==========================================
-- GALLERY
-- ==========================================
insert into gallery
  (title, category, description, image_url, gallery_date, status)
values
  ('Tahfidz Al-Quran Morning Session', 'Tahfidz', 'Students memorizing Quran in the main prayer hall with teachers.', 'https://images.unsplash.com/photo-1609599006353-e62955250111?w=800', '2026-02-15', 'active'),
  ('Science Lab Experiment Grade 11', 'Learning', 'Practical chemistry sessions using modernized tools under tutor supervision.', 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=800', '2026-02-18', 'active'),
  ('Annual Sports & Archery League', 'Sports', 'Students participating in traditional and modern athletic sports championships.', 'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=800', '2026-02-20', 'active'),
  ('FIWA Campus Green Garden', 'Campus', 'The beautiful botanical and environmental garden path across the campus.', 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=800', '2026-02-22', 'active');

-- ==========================================
-- ANNOUNCEMENTS
-- ==========================================
insert into announcements
  (title, category, announcement_date, description, image_url, link_url, is_featured, status)
values
  ('Annual Quran Memorization Contest 2026', 'Event', '2026-03-01', 'Registration is open for students across all grades. Prepare your recitation.', 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=600&auto=format&fit=crop', 'https://fiwa.sch.id', true, 'active'),
  ('Important Announcement: Mid-Term Examination Guidelines', 'Academic', '2026-03-05', 'Detailed rules, schedules, and materials required for the mid-term examinations have been released.', null, null, false, 'active');
-- ==========================================
-- ACADEMIC CALENDAR
-- ==========================================
insert into academic_calendar
  (start_date, end_date, title, category, description, location, level, status)
values
  ('2026-07-05', '2026-07-05', 'Check-in Grade 7 SMP & Grade 10 SMA (Santri Baru)', 'Orientation', 'Santri baru kelas 7 SMP dan kelas 10 SMA masuk asrama dan registrasi berkas.', 'Campus Dormitory', 'All', 'active'),
  ('2026-07-06', '2026-07-24', 'Orientation Program (MOS, Matrikulasi & Adab Islami)', 'Orientation', 'Program orientasi adab penuntut ilmu, tahsin Al-Quran, serta matrikulasi bahasa & sains.', 'FIWA Campus', 'All', 'active'),
  ('2026-07-26', '2026-07-26', 'Check-in Santri Lama (G8, G9 SMP & G11, G12 SMA)', 'Orientation', 'Kedatangan santri lama kembali ke kampus asrama FIWA.', 'Campus Dormitory', 'All', 'active'),
  ('2026-07-27', '2026-08-01', 'Reorientation, Goal Setting & Career Pathway', 'Orientation', 'Reorientasi akademik santri senior, penataan target tahfidz 30 juz dan persiapan karir.', 'FIWA Campus', 'All', 'active'),
  ('2026-08-03', '2026-08-29', 'Pembelajaran Blok 1 (Block 1 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Cambridge & Pesantren Blok 1.', 'FIWA Campus', 'All', 'active'),
  ('2026-08-09', '2026-08-09', 'Parent Visit Santri Baru (G7 SMP & G10 SMA)', 'Parent Activity', 'Kunjungan perdana wali santri baru kelas 7 SMP dan 10 SMA.', 'Campus Area', 'All', 'active'),
  ('2026-08-17', '2026-08-17', 'Peringatan HUT Kemerdekaan RI ke-81', 'School Event', 'Upacara bendera peringatan kemerdekaan Republik Indonesia dan lomba kepanduan santri.', 'Main Sports Ground', 'All', 'active'),
  ('2026-08-18', '2026-08-21', 'Simulasi & Pelaksanaan ANBK G11 SMA', 'Examination', 'Asesmen Nasional Berbasis Komputer jenjang kelas 11 SMA.', 'Computer Lab', 'SMA', 'active'),
  ('2026-08-24', '2026-08-27', 'Simulasi & Pelaksanaan ANBK G8 SMP', 'Examination', 'Asesmen Nasional Berbasis Komputer jenjang kelas 8 SMP.', 'Computer Lab', 'SMP', 'active'),
  ('2026-08-31', '2026-09-26', 'Pembelajaran Blok 2 (Block 2 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 2.', 'FIWA Campus', 'All', 'active'),
  ('2026-09-06', '2026-09-06', 'Parent Visit SMP & SMA (All Grades)', 'Parent Activity', 'Kunjungan seluruh wali santri SMP & SMA ke kampus FIWA.', 'Campus Area', 'All', 'active'),
  ('2026-09-18', '2026-09-19', 'FIWA Islamic Science & Tech Fair 2026', 'Student Activity', 'Pameran karya riset sains santri, robotik, dan kompetisi inovasi teknologi Islam.', 'Main Hall & Labs', 'All', 'active'),
  ('2026-09-30', '2026-10-01', 'Mukhayyam Al-Quran & Leadership Camp', 'Student Activity', 'Kegiatan perkemahan alam terbuka, pembentukan adab, kemandirian dan kepemimpinan.', 'Outdoor Camp Area', 'All', 'active'),
  ('2026-10-02', '2026-10-04', 'Student Break (Pasca Mukhayyam)', 'Holiday', 'Kepulangan singkat santri pasca pelaksanaan kegiatan Mukhayyam.', 'Off Campus', 'All', 'active'),
  ('2026-10-03', '2026-10-03', 'Parent Teacher Conference (PTC) Blok 1-2 & Edu Expo', 'Parent Activity', 'Konsultasi laporan perkembangan santri kuartal 1 dan expo bimbingan studi lanjut.', 'Auditorium Hall', 'All', 'active'),
  ('2026-10-05', '2026-10-31', 'Pembelajaran Blok 3 (Block 3 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 3.', 'FIWA Campus', 'All', 'active'),
  ('2026-10-22', '2026-10-22', 'Peringatan Hari Santri Nasional 2026', 'School Event', 'Apel Hari Santri Nasional, bedah kitab ulama Nusantara, dan festival seni Islam.', 'Campus Mosque & Plaza', 'All', 'active'),
  ('2026-11-02', '2026-11-28', 'Pembelajaran Blok 4 (Block 4 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 4.', 'FIWA Campus', 'All', 'active'),
  ('2026-11-08', '2026-11-08', 'Parent Visit SMP & SMA', 'Parent Activity', 'Kunjungan rutin wali santri SMP & SMA.', 'Campus Area', 'All', 'active'),
  ('2026-11-14', '2026-11-15', 'FIWA Language Month (Bulan Bahasa Arab & Inggris)', 'Student Activity', 'Kompetisi debat bahasa Arab & Inggris, speech contest, dan drama sastra Islami.', 'School Auditorium', 'All', 'active'),
  ('2026-11-30', '2026-12-19', 'Pembelajaran Blok 5 (Block 5 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 5.', 'FIWA Campus', 'All', 'active'),
  ('2026-12-14', '2026-12-18', 'Tasmi Akbar Tahfidz 5, 10, 20 & 30 Juz Smt 1', 'Academic', 'Ujian simakan hafalan Al-Quran sekali duduk bersanad santri berprestasi.', 'Campus Mosque', 'All', 'active'),
  ('2026-12-21', '2026-12-26', 'Semester 1 Exam (PAS / SAS SMP & SMA)', 'Examination', 'Ujian Penilaian Akhir Semester Ganjil Terpadu SMP & SMA.', 'Classrooms', 'All', 'active'),
  ('2026-12-28', '2027-01-16', 'Semester 1 Break (Libur Panjang Semester Ganjil)', 'Holiday', 'Liburan resmi akhir semester ganjil santri FIWA.', 'Off Campus', 'All', 'active'),
  ('2027-01-02', '2027-01-02', 'PTC & Pembagian Raport Semester 1', 'Parent Activity', 'Pembagian laporan hasil belajar semester ganjil dan evaluasi perkembangan santri.', 'School Hall', 'All', 'active'),
  ('2027-01-17', '2027-01-17', 'Check-in for All Students SMP & SMA', 'Orientation', 'Kedatangan kembali seluruh santri ke asrama untuk memulai Semester Genap.', 'Campus Dormitory', 'All', 'active'),
  ('2027-01-18', '2027-02-13', 'Pembelajaran Blok 6 (Block 6 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 6.', 'FIWA Campus', 'All', 'active'),
  ('2027-01-29', '2027-01-30', 'FIWA Annual Sports League & Archery Cup', 'Student Activity', 'Turnamen olahraga panahan, berkuda, renang, futsal dan basket antarkelas.', 'Sports Complex', 'All', 'active'),
  ('2027-02-14', '2027-02-14', 'Parent Visit SMP & SMA', 'Parent Activity', 'Kunjungan rutin wali santri.', 'Campus Area', 'All', 'active'),
  ('2027-02-15', '2027-02-15', 'Campus Expo, Study Tour & University Visit', 'Student Activity', 'Kunjungan studi wawasan kampus perguruan tinggi internasional & field trip SMP.', 'University & External', 'All', 'active'),
  ('2027-02-15', '2027-03-06', 'Pembelajaran Blok 7 (Block 7 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 7.', 'FIWA Campus', 'All', 'active'),
  ('2027-02-27', '2027-02-28', 'FIWA International Quranic Olympiad (FIQO)', 'Student Activity', 'Musabaqah Hifzhil Quran (MHQ) dan olimpiade wawasan keislaman tingkat nasional.', 'Auditorium Hall', 'All', 'active'),
  ('2027-03-06', '2027-03-06', 'Parent Teacher Conference (PTC) Blok 6-7', 'Parent Activity', 'Konsultasi tengah semester genap laporan tahfidz dan akademik.', 'School Hall', 'All', 'active'),
  ('2027-03-08', '2027-03-27', 'Eid al-Fitr 1448 H & Ramadhan Holiday', 'Holiday', 'Libur Hari Raya Idul Fitri 1448 H dan libur Ramadhan santri.', 'Off Campus', 'All', 'active'),
  ('2027-03-28', '2027-03-28', 'Check-in Post-Eid for All Students', 'Orientation', 'Kedatangan kembali seluruh santri ke asrama pasca libur Hari Raya Idul Fitri.', 'Campus Dormitory', 'All', 'active'),
  ('2027-03-29', '2027-04-24', 'Pembelajaran Blok 8 (Block 8 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 8.', 'FIWA Campus', 'All', 'active'),
  ('2027-04-12', '2027-04-17', 'Tes Keterampilan Akademik (TKA) SMP', 'Examination', 'Pelaksanaan Tes Keterampilan Akademik berkala santri SMP.', 'Computer Lab', 'SMP', 'active'),
  ('2027-04-19', '2027-04-30', 'Pendampingan UTBK-SNBT & Simulasi Ujian SMA', 'Examination', 'Bimbingan intensif persiapan UTBK perguruan tinggi negeri dan universitas luar negeri.', 'FIWA Center', 'SMA', 'active'),
  ('2027-04-26', '2027-05-22', 'Pembelajaran Blok 9 (Block 9 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 9.', 'FIWA Campus', 'All', 'active'),
  ('2027-05-02', '2027-05-02', 'Parent Visit SMP & SMA', 'Parent Activity', 'Kunjungan rutin wali santri bulan Mei.', 'Campus Area', 'All', 'active'),
  ('2027-05-10', '2027-05-22', 'Final Exam G9 SMP & G12 SMA (Ujian Sekolah Kelulusan)', 'Examination', 'Ujian Akhir Sekolah penentu kelulusan santri akhir angkatan.', 'Examination Hall', 'All', 'active'),
  ('2027-05-16', '2027-05-16', 'Peringatan Hari Raya Idul Adha 1448 H', 'Holiday', 'Shalat Idul Adha bersama, penyembelihan hewan qurban dan pembinaan kepedulian sosial.', 'Campus Mosque & Plaza', 'All', 'active'),
  ('2027-05-24', '2027-06-19', 'Pembelajaran Blok 10 (Block 10 Term)', 'Academic', 'Periode Pembelajaran Kurikulum Terpadu Blok 10 (Blok Akhir).', 'FIWA Campus', 'All', 'active'),
  ('2027-06-14', '2027-06-18', 'Tasmi Akbar 30 Juz Bil Ghoib Sekali Duduk', 'Academic', 'Ujian simakan hafalan Al-Quran 30 juz bil ghoib khatam sekali duduk.', 'Campus Mosque', 'All', 'active'),
  ('2027-06-21', '2027-06-26', 'Semester 2 Exam (PAT / SAT Kenaikan Kelas)', 'Examination', 'Ujian Akhir Semester Genap (Penilaian Akhir Tahun) SMP & SMA.', 'Classrooms', 'All', 'active'),
  ('2027-06-26', '2027-06-27', 'Graduation Ceremony & Haflah Wisuda Santri Akhir', 'School Event', 'Haflah Khotmil Quran & wisuda kelulusan santri angkatan SMP & SMA.', 'FIWA Main Auditorium', 'All', 'active'),
  ('2027-06-30', '2027-06-30', 'PTC & Pembagian Raport Semester Genap', 'Parent Activity', 'Pembagian raport kenaikan kelas dan evaluasi tahunan dengan wali santri.', 'School Hall', 'All', 'active'),
  ('2027-06-28', '2027-07-17', 'Semester 2 Break (Libur Kenaikan Kelas)', 'Holiday', 'Libur panjang akhir tahun ajaran 2026/2027.', 'Off Campus', 'All', 'active');
