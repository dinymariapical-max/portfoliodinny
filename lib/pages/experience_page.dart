// lib/pages/experience_page.dart
import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/stripe_background.dart';
import '../widgets/torn_paper_divider.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  static const List<Map<String, dynamic>> _experiences = [
    {
      'role': 'Expert Staff of Content',
      'org': 'ITS Basketball Club 2026',
      'period': 'February 2026 – Present',
      'icon': Icons.sports_basketball_rounded,
      'tag': 'Content & Strategy',
      'isCurrent': true,
      'bullets': [
        'Created engaging social media content to increase audience interaction and maintain the activity of the club’s Instagram account.',
        'Initiated fun and interactive call-to-action campaigns through Instagram Stories to attract new members and boost engagement.',
        'Collaborated with the team in planning and organizing content strategies to ensure consistent and appealing social media presence.',
      ],
    },
    {
      'role': 'Head Division of BnM',
      'org': 'ITS Jazz 2026',
      'period': 'January 2026 – Present',
      'icon': Icons.music_note_rounded,
      'tag': 'Leadership & Branding',
      'isCurrent': true,
      'bullets': [
        'Developed and structured operational guidelines for the division including SOP, GSM, and key performance indicators (KPIs).',
        'Managed branding activities during events such as live reporting and producing post-event recap content.',
        'Coordinated and supervised staff members while leading regular meetings to ensure effective teamwork and smooth execution of tasks.',
      ],
    },
    {
      'role': 'Staff of PDD',
      'org': 'ILITS X IKARSID 2026',
      'period': 'December 2025 – February 2026',
      'icon': Icons.palette_rounded,
      'tag': 'Design & Documentation',
      'isCurrent': false,
      'bullets': [
        'Made various design such as ID Card, photobooth backdrop, faculty parade board, and more.',
        'Created content promotion for ILITS x IKARSID 2026.',
        'Documented lots of photos and videos on the main event.',
      ],
    },
    {
      'role': 'Participant of Basic Media Schooling',
      'org': 'Himpunan Mahasiswa Sistem Informasi',
      'period': 'September 2025',
      'icon': Icons.workspace_premium_rounded,
      'tag': 'Media & Web Award',
      'isCurrent': false,
      'bullets': [
        'Acquired comprehensive media skills such as video storytelling, graphic design, and HTML portfolio development.',
        'Built functional portfolio website as final project using HTML.',
        'Recognized with achievement award for excellent performance.',
      ],
    },
    {
      'role': 'Intern Staff of Official Account',
      'org': 'Himpunan Mahasiswa Sistem Informasi',
      'period': 'July 2025 – January 2026',
      'icon': Icons.campaign_rounded,
      'tag': 'Social Media & Figma',
      'isCurrent': false,
      'bullets': [
        'Documented and reported on all internal and external events, serving as a live reporter for activities like HIMA Visit.',
        'Managed daily Instagram content, including copywriting and publishing 5+ weekly posts to maintain consistent audience engagement.',
        'Coordinated media partner requests by creating visuals with Figma and distributing them across all social media platforms.',
      ],
    },
    {
      'role': 'Staff of Ignatian Day 2025',
      'org': 'Keluarga Mahasiswa Katolik ITS',
      'period': 'April 2025 – August 2025',
      'icon': Icons.videocam_rounded,
      'tag': 'Creative & Video',
      'isCurrent': false,
      'bullets': [
        'Created a video promotion for Ignatian day.',
        'Designed posters for Ignatian day Competition.',
        'Live report and made recaps for Ignatian day Competition.',
      ],
    },
    {
      'role': 'Staff of Social Media Strategies',
      'org': 'ITS Music Festival 2025',
      'period': 'April 2025 – October 2025',
      'icon': Icons.festival_rounded,
      'tag': 'Social Media',
      'isCurrent': false,
      'bullets': [
        'Managing IMF 2025’s Social Media.',
        'Created contents for IMF Video Promotion, Made recaps, and Live Reporting.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final contentW = math.min(MediaQuery.of(context).size.width, 680.0);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: const Text('Experiences', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrapbook header banner
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
                            SizedBox(
                              width: 240,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: ClipRect(
                                  child: Align(
                                    alignment: const Alignment(0.01, -0.02),
                                    widthFactor: 0.58,
                                    heightFactor: 0.42,
                                    child: Image.asset(
                                      'assets/text_images/Experiences.png',
                                      errorBuilder: (_, _, _) => const Text(
                                        'Experiences',
                                        style: AppTextStyles.pageTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Wrap(
                              spacing: 10,
                              runSpacing: 8,
                              alignment: WrapAlignment.center,
                              children: const [
                                _SummaryPill(
                                  icon: Icons.work_history_rounded,
                                  label: '7 Experiences',
                                  filled: true,
                                ),
                                _SummaryPill(
                                  icon: Icons.calendar_today_rounded,
                                  label: '2025 – Present',
                                  filled: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const TornPaperDivider(
                    bottomColor: AppColors.cream,
                    height: 52,
                  ),
                ],
              ),
            ),

            // Timeline list
            Center(
              child: SizedBox(
                width: contentW,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _experiences.asMap().entries.map((entry) {
                      final i = entry.key;
                      final exp = entry.value;
                      return _TimelineItem(
                        index: i + 1,
                        role: exp['role'] as String,
                        org: exp['org'] as String,
                        period: exp['period'] as String,
                        tag: exp['tag'] as String,
                        icon: exp['icon'] as IconData,
                        isCurrent: exp['isCurrent'] as bool,
                        bullets: (exp['bullets'] as List).cast<String>(),
                        isLast: i == _experiences.length - 1,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool filled;

  const _SummaryPill({
    required this.icon,
    required this.label,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: filled ? AppColors.darkRed : AppColors.cream,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.darkRed, width: 1.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15,
            color: filled ? AppColors.cream : AppColors.darkRed,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: filled ? AppColors.cream : AppColors.darkRed,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final int index;
  final String role, org, period, tag;
  final IconData icon;
  final bool isCurrent;
  final List<String> bullets;
  final bool isLast;

  const _TimelineItem({
    required this.index,
    required this.role,
    required this.org,
    required this.period,
    required this.tag,
    required this.icon,
    required this.isCurrent,
    required this.bullets,
    required this.isLast,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline axis
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _hovered || widget.isCurrent
                      ? AppColors.darkRed
                      : AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.darkRed, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkRed.withValues(alpha: 0.22),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '0${widget.index}',
                    style: GoogleFonts.nunito(
                      color: _hovered || widget.isCurrent
                          ? AppColors.white
                          : AppColors.darkRed,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2.5,
                    color: AppColors.darkRed.withValues(alpha: 0.28),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 22),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                child: AnimatedScale(
                  scale: _hovered ? 1.015 : 1.0,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutBack,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    transform: _hovered
                        ? Matrix4.translationValues(0.0, -3.0, 0.0)
                        : Matrix4.identity(),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: _hovered
                            ? AppColors.darkRed
                            : AppColors.lightBlue,
                        width: 1.6,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withValues(alpha: _hovered ? 0.14 : 0.06),
                          blurRadius: _hovered ? 16 : 8,
                          offset: Offset(0, _hovered ? 6 : 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                color: AppColors.darkRed.withValues(alpha: 0.10),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                widget.icon,
                                color: AppColors.darkRed,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.role,
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: AppColors.darkRed,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    widget.org,
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: widget.isCurrent
                                    ? AppColors.darkRed
                                    : AppColors.lightBlue.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.period,
                                style: GoogleFonts.nunito(
                                  fontSize: 11.5,
                                  color: widget.isCurrent
                                      ? AppColors.white
                                      : AppColors.darkRed,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cream,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.darkRed.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                widget.tag,
                                style: GoogleFonts.nunito(
                                  fontSize: 11.5,
                                  color: AppColors.darkRed,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...widget.bullets.map(
                          (b) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: AppColors.darkRed,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 9),
                                Expanded(
                                  child: Text(
                                    b,
                                    style: GoogleFonts.nunito(
                                      fontSize: 13.5,
                                      color: AppColors.black,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
