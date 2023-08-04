import 'package:app/screens/aboutapp.dart';
import 'package:app/screens/aboutus.dart';
import 'package:app/screens/darkmood.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      endDrawer: Mydrawar(),
    );
  }
}
