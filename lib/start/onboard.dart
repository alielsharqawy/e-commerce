// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:app/sign/login.dart';
import 'package:app/widget/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ignore:
  PageController MyController = PageController();
  bool Islastpage = false;
  @override
  void dispose() {
    MyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: MyController,
          onPageChanged: (index) {
            setState(() {
              Islastpage = index == 1;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            LogoImage(),
            LogoImage(),
          ],
        ),
      ),
      bottomSheet: Islastpage
          ? TextButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: 150,
                  bottom: 20,
                ),
                child: Text(
                  "LET'S START!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => {
                      MyController.jumpToPage(1),
                    },
                    child: Text("Skip", style: TextStyle(color: Colors.grey)),
                  ),
                  SmoothPageIndicator(
                    controller: MyController, // PageController
                    count: 2,
                    effect: const WormEffect(
                      spacing: 25,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.blue,
                    ),
                    onDotClicked: (index) => MyController.animateToPage(
                      index,
                      duration: const Duration(
                        milliseconds: 5,
                      ),
                      curve: Curves.easeInQuad,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      MyController.nextPage(
                        duration: const Duration(microseconds: 5),
                        curve: Curves.easeInOut,
                      ),
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }
}
