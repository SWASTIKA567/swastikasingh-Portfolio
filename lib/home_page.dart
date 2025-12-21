import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text(
          'Home Page Loaded Successfully ',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
