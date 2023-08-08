// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:app/widget/logo_image.dart';
import 'package:app/screens/start/onboard.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    StartTimer();
  }

  // ignore: non_constant_identifier_names
  StartTimer() async {
    var duaration = Duration(seconds: 3);
    return Timer(duaration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  OnboardingScreen(),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LogoImage(),
      ),
    );
  }
}
