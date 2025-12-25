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
                        : 'assets/web.jpeg',
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
                            left: isMobile ? 20 : width * 0.163,
                            top: isMobile ? height * 0.07 : height * 0.038,
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
                        ],
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
