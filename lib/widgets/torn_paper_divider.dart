// lib/widgets/torn_paper_divider.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Draws a torn-paper edge transition between the hero (stripe) section
/// and the red "Get to know me" section below.
class TornPaperDivider extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;
  final double height;

  const TornPaperDivider({
    super.key,
    required this.topColor,
    required this.bottomColor,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _TornPaperPainter(topColor: topColor, bottomColor: bottomColor),
      ),
    );
  }
}

class _TornPaperPainter extends CustomPainter {
  final Color topColor;
  final Color bottomColor;

  _TornPaperPainter({required this.topColor, required this.bottomColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Bottom fill
    final bgPaint = Paint()..color = bottomColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Top torn-paper shape
    final paint = Paint()..color = topColor;
    final path = Path();
    path.moveTo(0, 0);

    final random = math.Random(42); // fixed seed for consistent look
    double x = 0;
    path.lineTo(0, size.height * 0.4);

    while (x < size.width) {
      final step = 10.0 + random.nextDouble() * 18;
      final dy = size.height * 0.3 + random.nextDouble() * size.height * 0.4;
      x += step;
      path.lineTo(math.min(x, size.width), dy);
    }
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);

    // Shadow along the tear line
    final shadowPaint = Paint()
      ..color = Colors.black26
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawPath(path, shadowPaint);
    // Re-draw on top
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TornPaperPainter old) => false;
}
