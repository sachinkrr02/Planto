import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:planto/pages/homepage.dart';
import 'package:planto/pages/onboardingScreens/onBoardingModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.skip_next))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoarding(
                  image: demo_data[index].image,
                  desc: demo_data[index].desc,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 10), curve: Curves.ease);
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.lightGreen,
              ),
              child: Icon(
                Icons.arrow_right_alt_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
    required this.image,
    required this.desc,
  });
  final String image, desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 600,
              width: 300,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
