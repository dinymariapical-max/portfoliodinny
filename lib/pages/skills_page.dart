// lib/pages/skills_page.dart
import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  static const List<Map<String, dynamic>> _hardSkills = [
    {
      'name': 'Content Creation & Promotional Design',
      'subtitle': 'Campaign visuals, posters, ID cards & backdrops',
      'level': 0.95,
      'icon': Icons.brush_rounded,
    },
    {
      'name': 'Canva & Graphic Editing',
      'subtitle': 'Daily feeds, stories & promotional layouts',
      'level': 0.95,
      'icon': Icons.design_services_rounded,
    },
    {
      'name': 'CapCut & Video Editing',
      'subtitle': 'Video promotions, event recaps & live reels',
      'level': 0.90,
      'icon': Icons.movie_creation_rounded,
    },
    {
      'name': 'Figma & Visual Branding',
      'subtitle': 'Media partner assets, GSM & UI mockups',
      'level': 0.88,
      'icon': Icons.layers_rounded,
    },
    {
      'name': 'Instagram & TikTok Strategy',
      'subtitle': 'Copywriting, 5+ weekly posts & interactive CTA',
      'level': 0.95,
      'icon': Icons.campaign_rounded,
    },
    {
      'name': 'HTML & Web Portfolio',
      'subtitle': 'Functional HTML portfolio & Flutter web UI',
      'level': 0.82,
      'icon': Icons.code_rounded,
    },
    {
      'name': 'Administration, Forms & Permit Letters',
      'subtitle': 'Organizational documents, SOPs & KPIs',
      'level': 0.88,
      'icon': Icons.description_rounded,
    },
  ];

  static const List<Map<String, dynamic>> _softSkills = [
    {
      'title': 'Time Management',
      'desc': 'Able to manage time very well across academic & organizational roles',
      'icon': Icons.schedule_rounded,
      'tilt': -0.015,
    },
    {
      'title': 'Leadership',
      'desc': 'Able to lead a group of individuals & supervise division staff',
      'icon': Icons.groups_rounded,
      'tilt': 0.015,
    },
    {
      'title': 'Cross-Generational Communication',
      'desc': 'Communicates well with older and younger people in ID & EN',
      'icon': Icons.forum_rounded,
      'tilt': -0.012,
    },
    {
      'title': 'Teamwork & Fast Learner',
      'desc': 'Creative, innovative, enthusiastic team player & detail-oriented',
      'icon': Icons.auto_awesome_rounded,
      'tilt': 0.015,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final contentW = math.min(screenW, 720.0);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: const Text('Skills', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 36),
        child: Center(
          child: SizedBox(
            width: contentW,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dark red header banner with custom white Skills.png
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkRed,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkRed.withValues(alpha: 0.28),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 170,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: ClipRect(
                            child: Align(
                              alignment: const Alignment(0.01, -0.54),
                              widthFactor: 0.32,
                              heightFactor: 0.55,
                              child: Image.asset(
                                'assets/text_images/Skills.png',
                                errorBuilder: (_, _, _) => Text(
                                  'Skills',
                                  style: AppTextStyles.pageTitle
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Creative Design, Social Media Strategy & Leadership',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.cream,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),

                // Hard Skills & Creative Tools
                _sectionHeading('🎨 Hard Skills & Creative Tools'),
                const SizedBox(height: 14),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final twoCols = constraints.maxWidth > 540;
                    final itemW = twoCols
                        ? (constraints.maxWidth - 14) / 2
                        : constraints.maxWidth;
                    return Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: _hardSkills
                          .map(
                            (s) => SizedBox(
                              width: itemW,
                              child: _HardSkillCard(skill: s),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                const SizedBox(height: 28),

                // Soft Skills
                _sectionHeading('🌟 Soft Skills'),
                const SizedBox(height: 14),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final twoCols = constraints.maxWidth > 520;
                    final itemW = twoCols
                        ? (constraints.maxWidth - 14) / 2
                        : constraints.maxWidth;
                    return Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: _softSkills
                          .map(
                            (s) => SizedBox(
                              width: itemW,
                              child: _SoftSkillSticker(skill: s),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
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
              fontSize: 19,
              color: AppColors.darkRed,
            ),
          ),
        ),
      ],
    );
  }
}

class _HardSkillCard extends StatefulWidget {
  final Map<String, dynamic> skill;
  const _HardSkillCard({required this.skill});

  @override
  State<_HardSkillCard> createState() => _HardSkillCardState();
}

class _HardSkillCardState extends State<_HardSkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final level = widget.skill['level'] as double;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.025 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
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
                blurRadius: _hovered ? 14 : 8,
                offset: Offset(0, _hovered ? 5 : 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: _hovered
                          ? AppColors.darkRed
                          : AppColors.darkRed.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(
                      widget.skill['icon'] as IconData,
                      color: _hovered ? AppColors.white : AppColors.darkRed,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.skill['name'] as String,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.skill['subtitle'] as String,
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.darkRed.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      '${(level * 100).toInt()}%',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 12.5,
                        color: AppColors.darkRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: level),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                builder: (context, animatedValue, _) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: animatedValue,
                      backgroundColor:
                          AppColors.lightBlue.withValues(alpha: 0.35),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.darkRed,
                      ),
                      minHeight: 9,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SoftSkillSticker extends StatefulWidget {
  final Map<String, dynamic> skill;
  const _SoftSkillSticker({required this.skill});

  @override
  State<_SoftSkillSticker> createState() => _SoftSkillStickerState();
}

class _SoftSkillStickerState extends State<_SoftSkillSticker> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final baseTilt = widget.skill['tilt'] as double;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _hovered = !_hovered),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(end: _hovered ? 0.0 : baseTilt),
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutBack,
          builder: (context, angle, child) {
            return Transform.rotate(
              angle: angle,
              child: AnimatedScale(
                scale: _hovered ? 1.03 : 1.0,
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutBack,
                child: child,
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _hovered ? AppColors.darkRed : AppColors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: _hovered ? AppColors.cream : AppColors.darkRed,
                width: 1.6,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: _hovered ? 0.18 : 0.07),
                  blurRadius: _hovered ? 14 : 8,
                  offset: Offset(0, _hovered ? 6 : 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: _hovered
                        ? AppColors.cream
                        : AppColors.darkRed.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.skill['icon'] as IconData,
                    color: AppColors.darkRed,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.skill['title'] as String,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: _hovered ? AppColors.white : AppColors.darkRed,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.skill['desc'] as String,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.45,
                          color: _hovered ? AppColors.cream : AppColors.black,
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
