// lib/pages/about_me_page.dart
import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/stripe_background.dart';
import '../widgets/torn_paper_divider.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contentW = math.min(MediaQuery.of(context).size.width, 640.0);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: const Text('About Me', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrapbook striped header + Polaroid + torn paper divider
            StripeBackground(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: contentW,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.darkRed,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.darkRed.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                'GET TO KNOW ME ✨',
                                style: GoogleFonts.nunito(
                                  color: AppColors.cream,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  letterSpacing: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 22),
                            const _PolaroidPhotoCard(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const TornPaperDivider(
                    bottomColor: AppColors.cream,
                    height: 54,
                  ),
                ],
              ),
            ),

            // Main content cards
            Center(
              child: SizedBox(
                width: contentW,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 8, 22, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 👋 Who I Am
                      _ScrapbookHoverCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionHeader('👋 Who I Am'),
                            const SizedBox(height: 12),
                            Text(
                              'Halo! Namaku Dinny Maria Pical, mahasiswa departemen Sistem '
                              'Informasi di Institut Teknologi Sepuluh Nopember yang sangat '
                              'kreatif, dan termotivasi serta antusias untuk mendapatkan '
                              'hubungan dan pengalaman dalam berorganisasi.\n\n'
                              'Saya komunikatif dalam Bahasa Inggris dan Indonesia, pandai '
                              'membangun relasi, perfectionist, dan memiliki keterampilan '
                              'yang baik dalam beberapa aplikasi design',
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                color: AppColors.black,
                                height: 1.65,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 🎓 Education
                      _ScrapbookHoverCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionHeader('🎓 Education'),
                            const SizedBox(height: 14),
                            const _EducationItem(
                              school: 'Institut Teknologi Sepuluh Nopember (ITS)',
                              major: 'Digital Innovation / Sistem Informasi',
                              period: '2024 – Present',
                              isCurrent: true,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Divider(
                                color: AppColors.lightBlue,
                                height: 1,
                              ),
                            ),
                            const _EducationItem(
                              school: 'SMAK Untung Suropati Sidoarjo',
                              major: 'Science Studies',
                              period: '2021 – 2024',
                              isCurrent: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ✨ Advantages & Personal Traits
                      _ScrapbookHoverCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionHeader('✨ Advantages & Personal Traits'),
                            const SizedBox(height: 12),
                            Text(
                              'Advantages',
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkRed,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: const [
                                _TraitChip(
                                  icon: Icons.schedule,
                                  label: 'Manages time really well',
                                ),
                                _TraitChip(
                                  icon: Icons.auto_awesome,
                                  label: 'Creative & innovative person',
                                ),
                                _TraitChip(
                                  icon: Icons.groups_rounded,
                                  label: 'Able to work in a team',
                                ),
                                _TraitChip(
                                  icon: Icons.bolt_rounded,
                                  label: 'Fast learner & enthusiastic',
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Personal Traits & Languages',
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkRed,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: const [
                                _TraitChip(
                                  icon: Icons.verified_rounded,
                                  label: 'Perfectionist & detail-oriented',
                                  highlighted: true,
                                ),
                                _TraitChip(
                                  icon: Icons.translate_rounded,
                                  label: 'Communicative in English & Bahasa Indonesia',
                                  highlighted: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 22,
          decoration: BoxDecoration(
            color: AppColors.darkRed,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AppColors.darkRed,
            ),
          ),
        ),
      ],
    );
  }
}

class _PolaroidPhotoCard extends StatefulWidget {
  const _PolaroidPhotoCard();

  @override
  State<_PolaroidPhotoCard> createState() => _PolaroidPhotoCardState();
}

class _PolaroidPhotoCardState extends State<_PolaroidPhotoCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _hovered = !_hovered),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(end: _hovered ? 0.0 : -0.03),
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutBack,
          builder: (context, angle, child) {
            return Transform.rotate(
              angle: angle,
              child: AnimatedScale(
                scale: _hovered ? 1.04 : 1.0,
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutBack,
                child: child,
              ),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 290,
                padding: const EdgeInsets.fromLTRB(14, 16, 14, 18),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _hovered
                        ? AppColors.darkRed.withValues(alpha: 0.45)
                        : AppColors.lightBlue,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: _hovered ? 0.24 : 0.16),
                      blurRadius: _hovered ? 22 : 14,
                      offset: Offset(0, _hovered ? 10 : 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: SizedBox(
                        width: double.infinity,
                        height: 270,
                        child: AnimatedScale(
                          scale: _hovered ? 1.06 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: Image.asset(
                            'assets/images/About Me.jpeg',
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            errorBuilder: (_, _, _) => Container(
                              color: AppColors.lightBlue.withValues(alpha: 0.3),
                              child: const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 72,
                                  color: AppColors.darkRed,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Dinny Maria Pical • Sidoarjo, Jawa Timur',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkRed,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'NRP 5051241026',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: AppColors.cream,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Decorative masking tape at top of Polaroid
              Positioned(
                top: -12,
                child: Transform.rotate(
                  angle: -0.05,
                  child: Container(
                    width: 86,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.cream.withValues(alpha: 0.88),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: AppColors.darkRed.withValues(alpha: 0.25),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.10),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String school;
  final String major;
  final String period;
  final bool isCurrent;

  const _EducationItem({
    required this.school,
    required this.major,
    required this.period,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isCurrent
                ? AppColors.darkRed
                : AppColors.lightBlue.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.school_rounded,
            color: isCurrent ? AppColors.white : AppColors.darkRed,
            size: 21,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                school,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                major,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                  color: AppColors.darkRed,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.cream,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.darkRed.withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  period,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkRed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TraitChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool highlighted;

  const _TraitChip({
    required this.icon,
    required this.label,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: highlighted
            ? AppColors.darkRed.withValues(alpha: 0.08)
            : AppColors.cream,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: highlighted
              ? AppColors.darkRed.withValues(alpha: 0.45)
              : AppColors.lightBlue,
          width: 1.3,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.darkRed),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrapbookHoverCard extends StatefulWidget {
  final Widget child;
  const _ScrapbookHoverCard({required this.child});

  @override
  State<_ScrapbookHoverCard> createState() => _ScrapbookHoverCardState();
}

class _ScrapbookHoverCardState extends State<_ScrapbookHoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: _hovered
            ? Matrix4.translationValues(0.0, -3.0, 0.0)
            : Matrix4.identity(),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? AppColors.darkRed : AppColors.lightBlue,
            width: 1.6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.14 : 0.06),
              blurRadius: _hovered ? 16 : 8,
              offset: Offset(0, _hovered ? 6 : 3),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
