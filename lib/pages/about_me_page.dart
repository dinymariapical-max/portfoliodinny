// lib/pages/about_me_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: Text('About Me', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar badge
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.darkRed,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 3),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
                  ],
                ),
                child: const Icon(Icons.person, color: AppColors.white, size: 44),
              ),
            ),
            const SizedBox(height: 20),
            Text('About Me', style: AppTextStyles.pageTitle),
            const SizedBox(height: 4),
            Container(height: 3, width: 60, color: AppColors.darkRed),
            const SizedBox(height: 20),
            _cardSection(
              title: '👋 Who I Am',
              content:
                  'Halo! Saya Dinny Maria Pical, mahasiswa Inovasi Digital tahun ke-2 yang bersemangat dalam dunia teknologi dan kreativitas digital. '
                  'Saya percaya bahwa teknologi yang dikombinasikan dengan desain yang baik bisa menciptakan pengalaman yang bermakna.',
            ),
            const SizedBox(height: 14),
            _cardSection(
              title: '🎓 Education',
              content: 'Mahasiswa S1 Inovasi Digital\nAngkatan 2024 (2nd Year)',
            ),
            const SizedBox(height: 14),
            _cardSection(
              title: '✨ Interests',
              content:
                  '• Mobile & Web Development\n'
                  '• UI/UX Design\n'
                  '• Digital Innovation\n'
                  '• Creative Technology',
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardSection({required String title, required String content}) {
    return Container(
      width: double.infinity,
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
          Text(
            title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.darkRed,
            ),
          ),
          const SizedBox(height: 8),
          Text(content, style: AppTextStyles.bodyText),
        ],
      ),
    );
  }
}
