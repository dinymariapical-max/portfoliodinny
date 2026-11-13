// lib/widgets/menu_button.dart
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.cream.withOpacity(0.88)
                  : AppColors.cream,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: _hovered ? AppColors.darkRed : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(_hovered ? 0.18 : 0.08),
                  blurRadius: _hovered ? 14 : 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    letterSpacing: 0.3,
                  ),
                ),
                const Icon(
                  Icons.bookmark,
                  color: AppColors.darkRed,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
