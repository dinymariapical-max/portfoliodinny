// lib/widgets/menu_button.dart
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class PortfolioMenuButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const PortfolioMenuButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<PortfolioMenuButton> createState() => _PortfolioMenuButtonState();
}

class _PortfolioMenuButtonState extends State<PortfolioMenuButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final scale = _pressed ? 0.97 : (_hovered ? 1.035 : 1.0);
    final translation =
        _hovered ? Matrix4.translationValues(5.0, -2.0, 0.0) : Matrix4.identity();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() {
          _hovered = false;
          _pressed = false;
        }),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutBack,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutBack,
              transform: translation,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(26, 12, 14, 12),
              decoration: BoxDecoration(
                color: _hovered
                    ? AppColors.white
                    : AppColors.cream,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: _hovered ? AppColors.darkRed : Colors.transparent,
                  width: 1.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: _hovered ? 0.24 : 0.12),
                    blurRadius: _hovered ? 16 : 8,
                    offset: Offset(0, _hovered ? 6 : 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.label,
                      style: GoogleFonts.nunito(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                        letterSpacing: 0.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: _hovered
                          ? AppColors.darkRed
                          : AppColors.darkRed.withValues(alpha: 0.10),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: AnimatedRotation(
                        turns: _hovered ? -0.125 : 0.0, // -0.785 rad (-45 deg) -> points right
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutBack,
                        child: CustomPaint(
                          size: const Size(16, 16),
                          painter: _DiagonalArrowPainter(
                            color: _hovered ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DiagonalArrowPainter extends CustomPainter {
  final Color color;
  const _DiagonalArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final stemPaint = Paint()
      ..color = color
      ..strokeWidth = 3.2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(w * 0.20, h * 0.20),
      Offset(w * 0.68, h * 0.68),
      stemPaint,
    );

    final headPath = Path()
      ..moveTo(w * 0.85, h * 0.85)
      ..lineTo(w * 0.34, h * 0.80)
      ..lineTo(w * 0.80, h * 0.34)
      ..close();

    final headPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(headPath, headPaint);

    final outlinePaint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(headPath, outlinePaint);
  }

  @override
  bool shouldRepaint(_DiagonalArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}
