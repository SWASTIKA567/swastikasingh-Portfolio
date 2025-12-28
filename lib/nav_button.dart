import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const NavButton({super.key, required this.text, required this.onTap});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double fontSize = width < 600
        ? 14
        : width < 1100
        ? 16
        : 18;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(0, isHovering ? 6 : 0, 0),
          child: AnimatedScale(
            scale: isHovering ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 200),

            child: GestureDetector(
              onTap: widget.onTap,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'InriaSans',
                  fontWeight: FontWeight.w300,
                  letterSpacing: fontSize * -0.03,
                  color: const Color(0xFFB5B5B5),
                  shadows: isHovering
                      ? [
                          const Shadow(color: Colors.white, blurRadius: 12),
                          const Shadow(color: Colors.white, blurRadius: 24),
                        ]
                      : [],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
