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
  bool animateButtons = false;

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
              child: Stack(
                children: [
                  Positioned(
                    left: isMobile ? 20 : width * 0.15,
                    bottom: isMobile ? 10 : 20,
                    child: AnimatedSlide(
                      offset: animateButtons
                          ? Offset.zero
                          : const Offset(-1.5, 0),
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.easeOutCubic,
                      child: NavButton(
                        text: 'Home',
                        onTap: () => scrollTo(homeKey),
                      ),
                    ),
                  ),

                  Positioned(
                    left: isMobile ? 20 : width * 0.35,
                    bottom: isMobile ? 10 : 20,
                    child: AnimatedSlide(
                      offset: animateButtons
                          ? Offset.zero
                          : const Offset(-1.5, 0),
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.easeOutCubic,
                      child: NavButton(
                        text: 'About',
                        onTap: () => scrollTo(aboutKey),
                      ),
                    ),
                  ),

                  Positioned(
                    left: isMobile ? 20 : width * 0.65,
                    bottom: isMobile ? 10 : 20,
                    child: AnimatedSlide(
                      offset: animateButtons
                          ? Offset.zero
                          : const Offset(1.5, 0),
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.easeOutCubic,
                      child: NavButton(
                        text: 'Projects',
                        onTap: () => scrollTo(projectsKey),
                      ),
                    ),
                  ),

                  Positioned(
                    left: isMobile ? 20 : width * 0.85,
                    bottom: isMobile ? 10 : 20,
                    child: AnimatedSlide(
                      offset: animateButtons
                          ? Offset.zero
                          : const Offset(1.5, 0),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutCubic,
                      child: NavButton(
                        text: 'Contact',
                        onTap: () => scrollTo(contactKey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            WebsiteSection(
              key: aboutKey,
              title: 'ABOUT ME',
              bgColor: Colors.black,
            ),

            WebsiteSection(
              key: projectsKey,
              title: 'PROJECTS',
              bgColor: Colors.grey,
            ),

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
