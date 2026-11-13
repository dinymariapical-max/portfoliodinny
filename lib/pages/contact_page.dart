// lib/pages/contact_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const List<Map<String, dynamic>> _contacts = [
    {'label': 'Email', 'value': 'dinnymp@email.com', 'icon': Icons.email_outlined},
    {'label': 'Instagram', 'value': '@dinnymp', 'icon': Icons.photo_camera_outlined},
    {'label': 'LinkedIn', 'value': 'linkedin.com/in/dinnymp', 'icon': Icons.work_outline},
    {'label': 'GitHub', 'value': 'github.com/dinnymp', 'icon': Icons.code},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: Text('Contact', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: AppColors.darkRed,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkRed.withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.chat_bubble_outline, color: AppColors.white, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'Hubungi Saya!',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Saya terbuka untuk kolaborasi, diskusi, atau sekadar sapa!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text('Contact Info', style: AppTextStyles.pageTitle),
            const SizedBox(height: 4),
            Container(height: 3, width: 95, color: AppColors.darkRed),
            const SizedBox(height: 20),
            ..._contacts.map((c) => _ContactCard(contact: c)),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final Map<String, dynamic> contact;
  const _ContactCard({required this.contact});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _copied = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.contact['value'] as String));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: _copyToClipboard,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.lightBlue, width: 1.5),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 3))
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.darkRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(widget.contact['icon'] as IconData, color: AppColors.darkRed, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.contact['label'] as String,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkRed,
                      ),
                    ),
                    Text(
                      widget.contact['value'] as String,
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                _copied ? Icons.check_circle : Icons.copy,
                color: _copied ? Colors.green : AppColors.darkRed.withOpacity(0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
