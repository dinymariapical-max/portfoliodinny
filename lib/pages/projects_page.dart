// lib/pages/projects_page.dart
import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/stripe_background.dart';
import '../widgets/torn_paper_divider.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const List<Map<String, dynamic>> _projects = [
    {
      'title': 'BnM Operational Guidelines (SOP, GSM & KPI) & Event Branding',
      'org': 'ITS Jazz 2026',
      'period': 'January 2026 – Present',
      'desc':
          'Structured division SOPs, Graphic Standard Manual (GSM), and KPIs while leading live reporting, branding execution, and post-event recap content.',
      'tags': ['GSM & SOP', 'Branding', 'KPI', 'Live Report'],
      'icon': Icons.music_note_rounded,
    },
    {
      'title': 'Event Visual Identity (ID Card, Backdrop & Parade Board)',
      'org': 'ILITS X IKARSID 2026',
      'period': 'December 2025 – February 2026',
      'desc':
          'Designed complete visual merchandise and event collaterals including ID Cards, photobooth backdrop, faculty parade board, promotional assets, and event documentation.',
      'tags': ['Graphic Design', 'Event Kit', 'Promotion', 'Documentation'],
      'icon': Icons.palette_rounded,
    },
    {
      'title': 'Interactive Social Media Campaigns & Reels/Stories',
      'org': 'ITS Basketball Club 2026 & HMSI',
      'period': 'July 2025 – Present',
      'desc':
          'Created interactive Instagram Story CTA campaigns, 5+ weekly feeds with copywriting, and Figma media-partner visuals to boost engagement and member recruitment.',
      'tags': ['Instagram', 'Copywriting', 'Figma', 'CTA Campaign'],
      'icon': Icons.sports_basketball_rounded,
    },
    {
      'title': 'Video Promotion, Competition Posters & Aftermovie Recaps',
      'org': 'ITS Music Festival 2025 & Ignatian Day 2025',
      'period': 'April 2025 – October 2025',
      'desc':
          'Produced promotional videos, competition posters, live event reporting, and engaging aftermovie recaps edited with Canva & CapCut.',
      'tags': ['CapCut', 'Canva', 'Video Promo', 'Poster Design'],
      'icon': Icons.movie_creation_rounded,
    },
    {
      'title': 'Personal Portfolio Website (HTML & Flutter Scrapbook App)',
      'org': 'Basic Media Schooling HMSI & Digital Innovation',
      'period': '2025 – 2026',
      'desc':
          'Built a functional HTML portfolio website as the final project in Basic Media Schooling and evolved it into this interactive Flutter scrapbook web portfolio.',
      'tags': ['HTML', 'Flutter', 'Dart', 'Scrapbook UI'],
      'icon': Icons.web_rounded,
    },
  ];

  static const List<Map<String, dynamic>> _achievements = [
    {
      'title': 'Achievement Award for Excellent Performance',
      'subtitle':
          'Basic Media Schooling, Himpunan Mahasiswa Sistem Informasi (September 2025)',
      'badge': '🏆 Award',
      'icon': Icons.emoji_events_rounded,
    },
    {
      'title': 'Head Division of Branding & Marketing (BnM)',
      'subtitle': 'ITS Jazz 2026 (January 2026 – Present)',
      'badge': '⭐ Leadership',
      'icon': Icons.workspace_premium_rounded,
    },
    {
      'title': 'Expert Staff of Content',
      'subtitle': 'ITS Basketball Club 2026 (February 2026 – Present)',
      'badge': '🎯 Creative Lead',
      'icon': Icons.auto_awesome_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final contentW = math.min(screenW, 680.0);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: const Text(
          'Project & Achivements',
          style: AppTextStyles.appBarTitle,
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrapbook header
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
                              width: math.min(contentW - 48, 360),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: ClipRect(
                                  child: Align(
                                    alignment: const Alignment(0.02, -0.40),
                                    widthFactor: 0.85,
                                    heightFactor: 0.60,
                                    child: Image.asset(
                                      'assets/text_images/Project & Achivements.png',
                                      errorBuilder: (_, _, _) => const Text(
                                        'Project & Achivements',
                                        style: AppTextStyles.pageTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.darkRed,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                'Featured Works & Highlights ✨',
                                style: GoogleFonts.nunito(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.cream,
                                ),
                              ),
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

            // Body
            Center(
              child: SizedBox(
                width: contentW,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionHeading('📌 Featured Projects & Works'),
                      const SizedBox(height: 16),
                      ..._projects.map((p) => _ProjectCard(project: p)),
                      const SizedBox(height: 22),
                      _sectionHeading('🏆 Achievements & Leadership Highlights'),
                      const SizedBox(height: 16),
                      ..._achievements
                          .map((a) => _AchievementItem(achievement: a)),
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

  Widget _sectionHeading(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 24,
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

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered ? 1.018 : 1.0,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            transform: _hovered
                ? Matrix4.translationValues(0.0, -3.0, 0.0)
                : Matrix4.identity(),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: _hovered
                            ? AppColors.darkRed
                            : AppColors.darkRed.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.project['icon'] as IconData,
                        color: _hovered ? AppColors.white : AppColors.darkRed,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project['title'] as String,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w800,
                              fontSize: 15.5,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${widget.project['org']} • ${widget.project['period']}',
                            style: GoogleFonts.nunito(
                              fontSize: 12.5,
                              color: AppColors.darkRed,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.project['desc'] as String,
                  style: GoogleFonts.nunito(
                    fontSize: 13.8,
                    color: AppColors.black,
                    height: 1.55,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  children: (widget.project['tags'] as List<String>).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.lightBlue,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkRed,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AchievementItem extends StatefulWidget {
  final Map<String, dynamic> achievement;
  const _AchievementItem({required this.achievement});

  @override
  State<_AchievementItem> createState() => _AchievementItemState();
}

class _AchievementItemState extends State<_AchievementItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _hovered ? AppColors.darkRed : AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _hovered
                    ? AppColors.cream
                    : AppColors.darkRed.withValues(alpha: 0.35),
                width: 1.6,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: _hovered ? 0.16 : 0.06),
                  blurRadius: _hovered ? 14 : 6,
                  offset: Offset(0, _hovered ? 5 : 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _hovered
                        ? AppColors.cream
                        : AppColors.darkRed.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.achievement['icon'] as IconData,
                    color: AppColors.darkRed,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _hovered
                              ? AppColors.cream.withValues(alpha: 0.2)
                              : AppColors.cream,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.achievement['badge'] as String,
                          style: GoogleFonts.nunito(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: _hovered ? AppColors.cream : AppColors.darkRed,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.achievement['title'] as String,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: _hovered ? AppColors.white : AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.achievement['subtitle'] as String,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: _hovered ? AppColors.cream : AppColors.darkRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
