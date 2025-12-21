import 'dart:async';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showName = false;

  @override
  void initState() {
    super.initState();

    // Animate name
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        showName = true;
      });
    });

    // Navigate to home page
    Future.delayed(const Duration(seconds: 11), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // NAME ANIMATION
          Center(
            child: AnimatedSlide(
              offset: showName ? Offset.zero : const Offset(0, 0.3),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: showName ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  'SWASTIKA SINGH',
                  style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),

          // WALKING 3D CHARACTER
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 380,
              width: 380,
              child: ModelViewer(
                src: 'assets/pushandforward.glb',
                animationName: 'Armature|Push_Forward_and_Stop|baselayer',

                autoRotate: false,
                cameraControls: false,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
