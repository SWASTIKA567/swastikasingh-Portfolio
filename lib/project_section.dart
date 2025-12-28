import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;

    return Container(
      height: height,
      width: double.infinity,
      color: Colors.grey.shade900,
      alignment: Alignment.center,
      child: Text(
        'PROJECTS',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: isMobile
              ? (width * 0.10).clamp(28.0, 36.0)
              : (width * 0.06).clamp(48.0, 72.0),
          color: Colors.white,
        ),
      ),
    );
  }
}
