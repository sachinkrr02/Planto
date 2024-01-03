import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planto/home/homepage.dart';
import 'package:planto/pages/loginSignup/login.dart';
import 'package:planto/pages/onboardingScreens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        const Duration(
            seconds: 1), // Adjust  the  duration according to requirements.
        // For Navigation
        () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
