import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;

    return Container(
      height: height,
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : width * 0.15,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: isMobile
                  ? (width * 0.10).clamp(28.0, 36.0)
                  : (width * 0.06).clamp(48.0, 72.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'I am an app developer who loves building clean and responsive apps.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: isMobile
                  ? (width * 0.045).clamp(14.0, 18.0)
                  : (width * 0.025).clamp(18.0, 22.0),
              height: 1.6,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
