import 'package:flutter/material.dart';
import 'package:portfolio/website_section.dart';
import 'nav_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 HOME / HERO SECTION (WITH BACKGROUND)
            Container(
              key: homeKey,
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    isMobile
                        ? 'assets/backgrounds/bg_mobile.png'
                        : 'assets/web.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  // NAVBAR
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      NavButton(text: 'Home', onTap: () => scrollTo(homeKey)),
                      NavButton(text: 'About', onTap: () => scrollTo(aboutKey)),
                      NavButton(
                        text: 'Projects',
                        onTap: () => scrollTo(projectsKey),
                      ),
                      NavButton(
                        text: 'Contact',
                        onTap: () => scrollTo(contactKey),
                      ),
                    ],
                  ),

                  const Spacer(),

                  const Spacer(),
                ],
              ),
            ),

            /// 🔹 ABOUT SECTION (NO BG IMAGE)
            WebsiteSection(
              key: aboutKey,
              title: 'ABOUT ME',
              bgColor: Colors.black,
            ),

            /// 🔹 PROJECTS SECTION
            WebsiteSection(
              key: projectsKey,
              title: 'PROJECTS',
              bgColor: Colors.grey,
            ),

            /// 🔹 CONTACT SECTION
            WebsiteSection(
              key: contactKey,
              title: 'CONTACT ME',
              bgColor: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
