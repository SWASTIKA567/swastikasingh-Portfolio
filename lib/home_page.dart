import 'package:flutter/material.dart';
import 'about_section.dart';
import 'project_section.dart';
import 'contact_section.dart';

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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animateButtons = true;
      });
    });
  }

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
                        : 'assets/web.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: animateButtons ? 1 : 0,
                    duration: const Duration(seconds: 2),
                    child: Align(
                      alignment: const Alignment(0, -0.25),

                      child: Stack(
                        children: [
                          Positioned(
                            left: (isMobile ? 20 : width * 0.163) - 14,
                            top:
                                (isMobile ? height * 0.07 : height * 0.038) -
                                10,
                            child: Text(
                              'Portfolio.',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile
                                    ? (width * 0.23).clamp(100.0, 160.0)
                                    : (width * 0.224).clamp(120.0, 300.0),
                                height: 1.0,
                                letterSpacing: isMobile
                                    ? -1.5
                                    : (width * -0.012).clamp(-18.0, -8.0),
                                color: Color(0xFFFF6594),
                              ),
                            ),
                          ),
                          Positioned(
                            left: (isMobile ? 20 : width * 0.18) - 150,
                            top:
                                (isMobile ? height * 0.07 : height * 0.038) +
                                100,
                            child: Text(
                              'MY',
                              style: TextStyle(
                                fontFamily: 'rage',
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile
                                    ? (width * 0.18).clamp(60.0, 90.0)
                                    : (width * 0.18).clamp(120.0, 200.0),
                                height: 1.0,
                                letterSpacing: isMobile
                                    ? (width * 0.18 * -0.03).clamp(-3.0, -2.0)
                                    : (width * 0.18 * -0.03).clamp(-6.0, -4.0),
                                color: Color(0xFFDFE1E2),
                              ),
                            ),
                          ),
                          Positioned(
                            left: (isMobile ? 22 : width * 0.18) + 90,
                            top:
                                (isMobile ? height * 0.25 : height * 0.22) -
                                150,
                            child: Text(
                              'APP DEVELOPER',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.w700,

                                fontSize: isMobile
                                    ? (width * 0.048).clamp(17.0, 23.0)
                                    : (width * 0.030).clamp(30.0, 48.0),

                                letterSpacing: isMobile
                                    ? (width * 0.045 * -0.08).clamp(-1.5, -0.8)
                                    : (width * 0.028 * -0.08).clamp(-5.0, -3.0),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 1.5),
                            child: Image.asset(
                              'assets/image.png',
                              width: isMobile
                                  ? (width * 0.75).clamp(260.0, 360.0)
                                  : (width * 0.35).clamp(520.0, 820.0),
                              fit: BoxFit.contain,
                            ),
                          ),

                          Align(
                            alignment: Alignment(0, 0.8),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: isMobile ? width * 0.02 : width * 0.04,
                              ),
                              child: Transform.rotate(
                                angle: -0.098,
                                child: Text(
                                  'Swastika Singh',
                                  style: TextStyle(
                                    fontFamily: 'QwitcherGrypen',
                                    fontWeight: FontWeight.w700,
                                    fontSize: isMobile
                                        ? (width * 0.12).clamp(40.0, 70.0)
                                        : (width * 0.12).clamp(80.0, 140.0),
                                    letterSpacing: isMobile
                                        ? (width * 0.12 * 0.05).clamp(2.0, 4.0)
                                        : (width * 0.10 * 0.05).clamp(4.0, 7.0),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    left: isMobile ? 20 : width * 0.15,
                    bottom: isMobile ? 10 : 20,
                    child: AnimatedSlide(
                      offset: animateButtons
                          ? Offset.zero
                          : const Offset(-1.5, 0),
                      duration: const Duration(seconds: 9),
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
                      duration: const Duration(seconds: 9),
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
                      duration: const Duration(seconds: 9),
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
                      duration: const Duration(seconds: 9),
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

            AboutSection(key: aboutKey),
            ProjectsSection(key: projectsKey),
            ContactSection(key: contactKey),
          ],
        ),
      ),
    );
  }
}
