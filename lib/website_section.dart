import 'package:flutter/material.dart';

class WebsiteSection extends StatelessWidget {
  final String title;
  final Color bgColor;

  const WebsiteSection({super.key, required this.title, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: width < 600 ? 20 : 80,
        vertical: 80,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: width < 600
              ? 28
              : width < 1100
              ? 36
              : 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
