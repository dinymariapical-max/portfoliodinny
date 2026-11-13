// lib/widgets/torn_paper_divider.dart
import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

/// Renders the torn-paper edge transition between the hero (stripe) section
/// and the dark-red "Get to know me" section below using assets/images/paper.png.
class TornPaperDivider extends StatelessWidget {
  final Color bottomColor;
  final double height;

  const TornPaperDivider({
    super.key,
    this.bottomColor = AppColors.darkRed,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: _PaperBackdropPainter(bottomColor: bottomColor),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: 0.91,
                child: Image.asset(
                  'assets/images/paper.png',
                  errorBuilder: (_, _, _) => const SizedBox(
                    width: 2665,
                    height: 514,
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

class _PaperBackdropPainter extends CustomPainter {
  final Color bottomColor;

  const _PaperBackdropPainter({required this.bottomColor});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Follow the opaque paper centerline so the upper edge remains transparent
    // (showing hero stripes and profile photo) while the lower half fills with
    // the red section color underneath the paper's drop shadow.
    final path = Path()
      ..moveTo(0, h * 0.42)
      ..lineTo(w * 0.11, h * 0.46)
      ..lineTo(w * 0.22, h * 0.38)
      ..lineTo(w * 0.33, h * 0.41)
      ..lineTo(w * 0.44, h * 0.51)
      ..lineTo(w * 0.55, h * 0.43)
      ..lineTo(w * 0.66, h * 0.34)
      ..lineTo(w * 0.77, h * 0.25)
      ..lineTo(w * 0.88, h * 0.23)
      ..lineTo(w, h * 0.28)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();

    canvas.drawPath(path, Paint()..color = bottomColor);
  }

  @override
  bool shouldRepaint(_PaperBackdropPainter oldDelegate) =>
      oldDelegate.bottomColor != bottomColor;
}
