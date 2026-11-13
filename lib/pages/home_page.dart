// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/menu_button.dart';
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
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
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
    {'label': 'Project & Achievements', 'page': const ProjectsPage()},
    {'label': 'Contact', 'page': const ContactPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const _HeroSection(),
            const _TornDivider(),
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
//  SAFE ASSET IMAGE — tidak crash jika file belum ada
// ════════════════════════════════════════════════════════════════════
class _SafeAssetImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final BoxFit fit;
  final Widget fallback;

  const _SafeAssetImage({
    required this.assetPath,
    required this.fallback,
    this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: width,
      fit: fit,
      errorBuilder: (_, __, ___) => fallback,
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  HERO SECTION
// ════════════════════════════════════════════════════════════════════
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final heroH = MediaQuery.of(context).size.height * 0.80;
    final isMobile = screenW < 600;

    return SizedBox(
      width: screenW,
      height: heroH,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Striped background ──────────────────────────────────
          Positioned.fill(
            child: CustomPaint(painter: _StripePainter()),
          ),

          // ── Portfolio header (custom text image) ────────────────
          Positioned(
            top: 36,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // "Portfolio" — gambar custom font dari kamu
                _SafeAssetImage(
                  assetPath: 'assets/text_images/header_portfolio.png',
                  width: isMobile ? screenW * 0.72 : 320,
                  fit: BoxFit.contain,
                  fallback: Text(
                    'Portfolio',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: isMobile ? 58 : 72,
                      color: AppColors.darkRed,
                    ),
                  ),
                ),
                // "2026" — gambar custom font dari kamu
                _SafeAssetImage(
                  assetPath: 'assets/text_images/header_year.png',
                  width: isMobile ? screenW * 0.38 : 160,
                  fit: BoxFit.contain,
                  fallback: Text(
                    '2026',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: isMobile ? 22 : 30,
                      color: AppColors.black,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Profile photo ───────────────────────────────────────
          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: math.min(screenW * 0.68, 340),
                child: _SafeAssetImage(
                  assetPath: 'assets/images/profile.jpg',
                  fit: BoxFit.fitWidth,
                  fallback: _ProfilePlaceholder(
                      size: math.min(screenW * 0.55, 280)),
                ),
              ),
            ),
          ),

          // ── 2nd year pill ───────────────────────────────────────
          Positioned(
            top: heroH * 0.38,
            left: screenW * 0.05,
            child: const _PillBadge(text: '2nd year'),
          ),

          // ── Inovasi Digital pill ────────────────────────────────
          Positioned(
            top: heroH * 0.52,
            right: screenW * 0.04,
            child: const _PillBadge(text: 'Inovasi Digital'),
          ),

          // ── Name banner ─────────────────────────────────────────
          Positioned(
            bottom: 44,
            left: 32,
            right: 32,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                decoration: BoxDecoration(
                  color: AppColors.darkRed,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkRed.withOpacity(0.45),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Text(
                  'Dinny Maria Pical',
                  style: AppTextStyles.nameLabel,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
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
        color: AppColors.lightBlue.withOpacity(0.35),
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
//  PILL BADGE
// ════════════════════════════════════════════════════════════════════
class _PillBadge extends StatelessWidget {
  final String text;
  const _PillBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.darkRed, width: 1.5),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Text(text, style: AppTextStyles.pillLabel),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  STRIPE PAINTER
// ════════════════════════════════════════════════════════════════════
class _StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      AppColors.white,
      AppColors.lightBlue.withOpacity(0.5),
    ];
    const stripeW = 30.0;
    for (int i = 0; i * stripeW < size.width + stripeW; i++) {
      final paint = Paint()..color = colors[i % 2];
      canvas.drawRect(
          Rect.fromLTWH(i * stripeW, 0, stripeW, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_StripePainter _) => false;
}

// ════════════════════════════════════════════════════════════════════
//  TORN PAPER DIVIDER
// ════════════════════════════════════════════════════════════════════
class _TornDivider extends StatelessWidget {
  const _TornDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: CustomPaint(painter: _TornPainter()),
    );
  }
}

class _TornPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = AppColors.darkRed,
    );

    final whitePaint = Paint()..color = AppColors.white;
    final path = Path()..moveTo(0, 0);

    final rng = math.Random(42);
    double x = 0;
    while (x < size.width) {
      final step = 10.0 + rng.nextDouble() * 22;
      final y =
          size.height * 0.2 + rng.nextDouble() * size.height * 0.55;
      x += step;
      path.lineTo(math.min(x, size.width), y);
    }
    path.lineTo(size.width, 0);
    path.close();

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.20)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, whitePaint);
  }

  @override
  bool shouldRepaint(_TornPainter _) => false;
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

    return Container(
      width: double.infinity,
      color: AppColors.darkRed,
      padding: const EdgeInsets.fromLTRB(28, 20, 28, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Get to know me" — gambar custom font dari kamu
          _SafeAssetImage(
            assetPath: 'assets/text_images/section_get_to_know_me.png',
            width: math.min(screenW * 0.85, 400),
            fit: BoxFit.contain,
            fallback: Text(
              'Get to\nknow me',
              style: GoogleFonts.pacifico(
                fontSize: 50,
                color: AppColors.white,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 28),
          // Menu buttons
          ...menuItems.map(
            (item) => PortfolioMenuButton(
              label: item['label'] as String,
              onTap: () => onMenuTap(item['page'] as Widget),
            ),
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              '© 2026 Dinny Maria Pical',
              style: AppTextStyles.copyright,
            ),
          ),
        ],
      ),
    );
  }
}
