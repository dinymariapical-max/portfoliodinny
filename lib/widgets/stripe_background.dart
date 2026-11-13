// lib/widgets/stripe_background.dart
import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

/// Paints the vertical blue-and-white stripe background seen in the hero section.
class StripePainter extends CustomPainter {
  final double stripeWidth;
  final Color color1;
  final Color color2;

  const StripePainter({
    this.stripeWidth = 28,
    this.color1 = AppColors.stripeBlue,
    this.color2 = AppColors.stripeWhite,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = color1;
    final paint2 = Paint()..color = color2;

    double x = 0;
    bool toggle = false;
    while (x < size.width) {
      canvas.drawRect(
        Rect.fromLTWH(x, 0, stripeWidth, size.height),
        toggle ? paint1 : paint2,
      );
      x += stripeWidth;
      toggle = !toggle;
    }
  }

  @override
  bool shouldRepaint(StripePainter oldDelegate) =>
      oldDelegate.stripeWidth != stripeWidth;
}

class StripeBackground extends StatelessWidget {
  final Widget child;
  final double stripeWidth;

  const StripeBackground({
    super.key,
    required this.child,
    this.stripeWidth = 28,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StripePainter(stripeWidth: stripeWidth),
      child: child,
    );
  }
}
