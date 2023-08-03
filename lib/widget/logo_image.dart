import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Image.asset("assets/logo.jpg"),
    );
  }
}
