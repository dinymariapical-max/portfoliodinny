// lib/pages/projects_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const List<Map<String, dynamic>> _projects = [
    {
      'title': 'Portfolio Web App',
      'type': 'Flutter Web',
      'desc': 'Aplikasi web portofolio personal dengan desain scrapbook menggunakan Flutter.',
      'tags': ['Flutter', 'Dart', 'Web'],
      'icon': Icons.web_asset,
    },
    {
      'title': 'UI/UX Mobile App',
      'type': 'Figma Design',
      'desc': 'Rancangan antarmuka aplikasi mobile untuk proyek kampus Inovasi Digital.',
      'tags': ['Figma', 'UI/UX', 'Mobile'],
      'icon': Icons.phone_iphone,
    },
    {
      'title': 'Digital Innovation Project',
      'type': 'Academic',
      'desc': 'Proyek inovasi digital yang mengeksplorasi solusi teknologi untuk masalah sosial.',
      'tags': ['Innovation', 'Research'],
      'icon': Icons.lightbulb,
    },
  ];

  static const List<Map<String, String>> _achievements = [
    {'title': 'Mahasiswa Aktif Inovasi Digital', 'desc': 'Prodi Inovasi Digital, 2024'},
    {'title': 'Flutter Development', 'desc': 'Tekber Course Project, 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: Text('Projects & Achievements', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Projects', style: AppTextStyles.pageTitle),
            const SizedBox(height: 4),
            Container(height: 3, width: 70, color: AppColors.darkRed),
            const SizedBox(height: 20),
            ..._projects.map((p) => _ProjectCard(project: p)),
            const SizedBox(height: 28),
            Text('Achievements', style: AppTextStyles.pageTitle),
            const SizedBox(height: 4),
            Container(height: 3, width: 110, color: AppColors.darkRed),
            const SizedBox(height: 20),
            ..._achievements.map((a) => _AchievementItem(achievement: a)),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightBlue, width: 1.5),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.darkRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(project['icon'] as IconData, color: AppColors.darkRed, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['title']!,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        project['type']!,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: AppColors.darkRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(project['desc']!, style: AppTextStyles.bodyText),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: (project['tags'] as List<String>).map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkRed,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final Map<String, String> achievement;
  const _AchievementItem({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkRed.withOpacity(0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.darkRed.withOpacity(0.3), width: 1.5),
        ),
        child: Row(
          children: [
            const Icon(Icons.emoji_events, color: AppColors.darkRed, size: 28),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    achievement['title']!,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    achievement['desc']!,
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      color: AppColors.darkRed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
