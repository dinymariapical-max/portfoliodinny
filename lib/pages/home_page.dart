// lib/pages/home_page.dart
import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/menu_button.dart';
import '../widgets/torn_paper_divider.dart';
import 'about_me_page.dart';
import 'experience_page.dart';
import 'skills_page.dart';
import 'projects_page.dart';
import 'contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _navigate(Widget page) {
    Navigator.push(context, _slideRoute(page));
  }

  PageRouteBuilder _slideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, animation, _) => page,
      transitionsBuilder: (_, animation, _, child) {
        final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static final List<Map<String, dynamic>> _menuItems = [
    {'label': 'About Me', 'page': const AboutMePage()},
    {'label': 'Experiences', 'page': const ExperiencePage()},
    {'label': 'Skills', 'page': const SkillsPage()},
    {'label': 'Project & Achivements', 'page': const ProjectsPage()},
    {'label': 'Contact', 'page': const ContactPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkRed,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _HeroSection(scrollController: _scrollController),
            _GetToKnowMe(
              menuItems: _menuItems,
              onMenuTap: _navigate,
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  CROPPED ASSET IMAGE — removes excess transparent padding around PNG
// ════════════════════════════════════════════════════════════════════
class _CroppedAssetImage extends StatelessWidget {
  final String assetPath;
  final double width;
  final Alignment alignment;
  final double widthFactor;
  final double heightFactor;
  final Widget fallback;

  const _CroppedAssetImage({
    required this.assetPath,
    required this.width,
    required this.alignment,
    required this.widthFactor,
    required this.heightFactor,
    required this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: ClipRect(
          child: Align(
            alignment: alignment,
            widthFactor: widthFactor,
            heightFactor: heightFactor,
            child: Image.asset(
              assetPath,
              errorBuilder: (_, _, _) => fallback,
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  HERO SECTION
// ════════════════════════════════════════════════════════════════════
class _HeroSection extends StatelessWidget {
  final ScrollController scrollController;

  const _HeroSection({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final contentW = math.min(screenW, 480.0);
    final heroH = contentW * 1.48;

    return SizedBox(
      width: screenW,
      height: heroH,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Striped background spanning full screen width ───────
          Positioned.fill(
            child: CustomPaint(painter: _StripePainter()),
          ),

          // ── Centered mobile-proportioned hero content ───────────
          Center(
            child: SizedBox(
              width: contentW,
              height: heroH,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // "Portfolio 2026" custom text image
                  Positioned(
                    top: contentW * 0.06,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _CroppedAssetImage(
                        assetPath: 'assets/text_images/Portfolio.png',
                        width: contentW * 0.74,
                        alignment: const Alignment(0.01, -0.06),
                        widthFactor: 0.63,
                        heightFactor: 0.50,
                        fallback: Column(
                          children: [
                            Text(
                              'Portfolio',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.pacifico(
                                fontSize: 58,
                                color: AppColors.darkRed,
                              ),
                            ),
                            Text(
                              '2026',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                fontSize: 26,
                                color: AppColors.black,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Interactive profile photo with cute hover/tap animation
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _InteractiveProfilePhoto(contentW: contentW),
                    ),
                  ),

                  // Scroll-animated "5051241026" pill (left) & "Inovasi Digital" pill (right)
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: scrollController,
                      builder: (context, _) {
                        final offset = scrollController.hasClients
                            ? scrollController.offset
                            : 0.0;
                        final t = (offset / (heroH * 0.55)).clamp(0.0, 1.0);

                        return TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeOutBack,
                          builder: (context, enter, _) {
                            final enterClamped = enter.clamp(0.0, 1.0);

                            // Left pill: 5051241026
                            final leftDx = -t * 130.0 + (1.0 - enter) * -40.0;
                            final leftRot = -t * 0.35;
                            final leftScale =
                                (1.0 - t * 0.25) * (0.75 + 0.25 * enter);
                            final leftOpacity =
                                ((1.0 - t) * enterClamped).clamp(0.0, 1.0);

                            // Right pill: Inovasi Digital
                            final rightDx = t * 130.0 + (1.0 - enter) * 40.0;
                            final rightRot = t * 0.35;
                            final rightScale =
                                (1.0 - t * 0.25) * (0.75 + 0.25 * enter);
                            final rightOpacity =
                                ((1.0 - t) * enterClamped).clamp(0.0, 1.0);

                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: heroH * 0.43,
                                  left: contentW * 0.11,
                                  child: IgnorePointer(
                                    ignoring: leftOpacity < 0.08,
                                    child: Opacity(
                                      opacity: leftOpacity,
                                      child: Transform.translate(
                                        offset: Offset(leftDx, 0),
                                        child: Transform.rotate(
                                          angle: leftRot,
                                          child: Transform.scale(
                                            scale: leftScale,
                                            child: const _PillBadge(
                                              text: '5051241026',
                                              baseRotation: -0.11,
                                              hoverWiggle: 0.08,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: heroH * 0.61,
                                  right: contentW * 0.06,
                                  child: IgnorePointer(
                                    ignoring: rightOpacity < 0.08,
                                    child: Opacity(
                                      opacity: rightOpacity,
                                      child: Transform.translate(
                                        offset: Offset(rightDx, 0),
                                        child: Transform.rotate(
                                          angle: rightRot,
                                          child: Transform.scale(
                                            scale: rightScale,
                                            child: const _PillBadge(
                                              text: 'Inovasi Digital',
                                              baseRotation: 0.11,
                                              hoverWiggle: -0.08,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // Interactive name banner above torn paper divider
                  Positioned(
                    bottom: contentW * 0.19,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _InteractiveNameBanner(contentW: contentW),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Torn paper divider bridging hero & Get to know me ───
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: TornPaperDivider(height: contentW * 0.18),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  INTERACTIVE PROFILE PHOTO (HOVER / TAP ANIMATION + SPARKLE BADGE)
// ════════════════════════════════════════════════════════════════════
class _InteractiveProfilePhoto extends StatefulWidget {
  final double contentW;
  const _InteractiveProfilePhoto({required this.contentW});

  @override
  State<_InteractiveProfilePhoto> createState() =>
      _InteractiveProfilePhotoState();
}

class _InteractiveProfilePhotoState extends State<_InteractiveProfilePhoto> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _hovered = !_hovered),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(end: _hovered ? 0.025 : 0.0),
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutBack,
              builder: (context, angle, child) {
                return Transform.rotate(
                  angle: angle,
                  alignment: Alignment.bottomCenter,
                  child: AnimatedScale(
                    scale: _hovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.easeOutBack,
                    alignment: Alignment.bottomCenter,
                    child: child,
                  ),
                );
              },
              child: _CroppedAssetImage(
                assetPath: 'assets/images/Profile.png',
                width: widget.contentW * 0.66,
                alignment: const Alignment(0.01, 1.0),
                widthFactor: 0.70,
                heightFactor: 0.90,
                fallback: _ProfilePlaceholder(
                  size: widget.contentW * 0.55,
                ),
              ),
            ),
            // Cute floating speech/sparkle badge on hover
            Positioned(
              top: 12,
              right: -6,
              child: IgnorePointer(
                child: AnimatedSlide(
                  offset: _hovered ? Offset.zero : const Offset(0, 0.25),
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutBack,
                  child: AnimatedScale(
                    scale: _hovered ? 1.0 : 0.75,
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOutBack,
                    child: AnimatedOpacity(
                      opacity: _hovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 180),
                      child: Transform.rotate(
                        angle: 0.08,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cream,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: AppColors.darkRed,
                              width: 1.8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkRed.withValues(alpha: 0.28),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            '✨ Hi there!',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: AppColors.darkRed,
                            ),
                          ),
                        ),
                      ),
                    ),
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

// ════════════════════════════════════════════════════════════════════
//  INTERACTIVE NAME BANNER
// ════════════════════════════════════════════════════════════════════
class _InteractiveNameBanner extends StatefulWidget {
  final double contentW;
  const _InteractiveNameBanner({required this.contentW});

  @override
  State<_InteractiveNameBanner> createState() => _InteractiveNameBannerState();
}

class _InteractiveNameBannerState extends State<_InteractiveNameBanner> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _hovered = !_hovered),
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutBack,
            transform: _hovered
                ? Matrix4.translationValues(0.0, -3.0, 0.0)
                : Matrix4.identity(),
            width: widget.contentW * 0.74,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 11,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkRed,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: _hovered ? AppColors.cream : Colors.transparent,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkRed.withValues(alpha: _hovered ? 0.55 : 0.40),
                  blurRadius: _hovered ? 20 : 14,
                  offset: Offset(0, _hovered ? 8 : 5),
                ),
              ],
            ),
            child: Text(
              'Dinny Maria Pical',
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
                letterSpacing: 0.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  PROFILE PLACEHOLDER
// ════════════════════════════════════════════════════════════════════
class _ProfilePlaceholder extends StatelessWidget {
  final double size;
  const _ProfilePlaceholder({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightBlue.withValues(alpha: 0.35),
        border: Border.all(color: AppColors.white, width: 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 80, color: AppColors.darkRed),
          const SizedBox(height: 8),
          Text(
            'Foto Anda\ndi sini',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: AppColors.darkRed,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  PILL BADGE (WITH CUTE WIGGLE & COLOR INVERT ON HOVER)
// ════════════════════════════════════════════════════════════════════
class _PillBadge extends StatefulWidget {
  final String text;
  final double baseRotation;
  final double hoverWiggle;

  const _PillBadge({
    required this.text,
    this.baseRotation = 0,
    this.hoverWiggle = 0.08,
  });

  @override
  State<_PillBadge> createState() => _PillBadgeState();
}

class _PillBadgeState extends State<_PillBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final targetAngle =
        widget.baseRotation + (_hovered ? widget.hoverWiggle : 0.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _hovered = !_hovered),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(end: targetAngle),
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutBack,
          builder: (context, angle, child) {
            return Transform.rotate(
              angle: angle,
              child: AnimatedScale(
                scale: _hovered ? 1.12 : 1.0,
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeOutBack,
                child: child,
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
            decoration: BoxDecoration(
              color: _hovered ? AppColors.darkRed : AppColors.cream,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: _hovered ? AppColors.cream : AppColors.darkRed,
                width: 1.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: _hovered ? 0.32 : 0.22),
                  blurRadius: _hovered ? 14 : 6,
                  offset: Offset(0, _hovered ? 6 : 3),
                ),
              ],
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: _hovered ? AppColors.cream : AppColors.darkRed,
              ),
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  STRIPE PAINTER
// ════════════════════════════════════════════════════════════════════
class _StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stripeW = size.width > 600 ? 480.0 / 13 : size.width / 13;
    final bluePaint = Paint()..color = AppColors.lightBlue;
    final whitePaint = Paint()..color = AppColors.white;

    for (int i = 0; i * stripeW < size.width; i++) {
      canvas.drawRect(
        Rect.fromLTWH(i * stripeW, 0, stripeW + 0.5, size.height),
        i.isEven ? bluePaint : whitePaint,
      );
    }
  }

  @override
  bool shouldRepaint(_StripePainter _) => false;
}

// ════════════════════════════════════════════════════════════════════
//  GET TO KNOW ME SECTION
// ════════════════════════════════════════════════════════════════════
class _GetToKnowMe extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;
  final void Function(Widget) onMenuTap;

  const _GetToKnowMe({required this.menuItems, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final contentW = math.min(screenW, 480.0);

    return Container(
      width: double.infinity,
      color: AppColors.darkRed,
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 44),
      child: Center(
        child: SizedBox(
          width: contentW,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "Get to know me" custom text image aligned right like reference
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: contentW * 0.06),
                  child: _CroppedAssetImage(
                    assetPath: 'assets/text_images/Get to know me.png',
                    width: contentW * 0.62,
                    alignment: const Alignment(0.01, -0.56),
                    widthFactor: 0.44,
                    heightFactor: 0.52,
                    fallback: Text(
                      'Get to\nknow me',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.pacifico(
                        fontSize: 46,
                        color: AppColors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              // Navigation menu buttons
              SizedBox(
                width: contentW * 0.74,
                child: Column(
                  children: menuItems
                      .map(
                        (item) => PortfolioMenuButton(
                          label: item['label'] as String,
                          onTap: () => onMenuTap(item['page'] as Widget),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                '© 2026 Dinny Maria Pical',
                style: AppTextStyles.copyright,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
