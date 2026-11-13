// lib/pages/experience_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  static const List<Map<String, String>> _experiences = [
    {
      'role': 'Flutter Developer',
      'org': 'Tekber Project',
      'period': '2025 – Sekarang',
      'desc': 'Mengembangkan aplikasi mobile dan web menggunakan Flutter & Dart sebagai bagian dari mata kuliah Teknik Berbasis.',
    },
    {
      'role': 'UI/UX Designer',
      'org': 'Proyek Kampus',
      'period': '2024 – 2025',
      'desc': 'Merancang antarmuka pengguna menggunakan Figma untuk berbagai proyek akademik dan lomba desain.',
    },
    {
      'role': 'Mahasiswa Aktif',
      'org': 'Program Studi Inovasi Digital',
      'period': '2024 – Sekarang',
      'desc': 'Mengeksplorasi inovasi digital, pengembangan produk, dan teknologi kreatif sebagai bagian dari program studi.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: Text('Experiences', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Experiences', style: AppTextStyles.pageTitle),
            const SizedBox(height: 4),
            Container(height: 3, width: 90, color: AppColors.darkRed),
            const SizedBox(height: 24),
            ..._experiences.asMap().entries.map((entry) {
              final i = entry.key;
              final exp = entry.value;
              return _TimelineItem(
                index: i + 1,
                role: exp['role']!,
                org: exp['org']!,
                period: exp['period']!,
                desc: exp['desc']!,
                isLast: i == _experiences.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final int index;
  final String role, org, period, desc;
  final bool isLast;

  const _TimelineItem({
    required this.index,
    required this.role,
    required this.org,
    required this.period,
    required this.desc,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline axis
          Column(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: AppColors.darkRed,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '0$index',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.darkRed.withOpacity(0.25),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.lightBlue, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(role,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: AppColors.darkRed,
                        )),
                    Text(org,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.black,
                        )),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        period,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: AppColors.darkRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(desc, style: AppTextStyles.bodyText),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
