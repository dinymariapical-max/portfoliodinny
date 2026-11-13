// lib/pages/skills_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  static const List<Map<String, dynamic>> _skills = [
    {'name': 'Flutter / Dart', 'level': 0.70, 'icon': Icons.phone_android},
    {'name': 'UI/UX Design (Figma)', 'level': 0.75, 'icon': Icons.design_services},
    {'name': 'Python', 'level': 0.55, 'icon': Icons.code},
    {'name': 'HTML & CSS', 'level': 0.65, 'icon': Icons.web},
    {'name': 'Digital Marketing', 'level': 0.60, 'icon': Icons.campaign},
    {'name': 'Problem Solving', 'level': 0.80, 'icon': Icons.psychology},
  ];

  @override
  Widget build(BuildContext context) {
    final crossCount = MediaQuery.of(context).size.width > 500 ? 2 : 1;
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: Text('Skills', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Skills', style: AppTextStyles.pageTitle),
            const SizedBox(height: 4),
            Container(height: 3, width: 50, color: AppColors.darkRed),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: crossCount,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2.5,
              children: _skills.map((s) => _SkillCard(skill: s)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Map<String, dynamic> skill;
  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightBlue, width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(skill['icon'] as IconData, color: AppColors.darkRed, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  skill['name'] as String,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${((skill['level'] as double) * 100).toInt()}%',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: AppColors.darkRed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: skill['level'] as double,
              backgroundColor: AppColors.lightBlue.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.darkRed),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
