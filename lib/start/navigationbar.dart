// ignore_for_file: prefer_const_constructors
import 'package:app/screens/aboutapp.dart';
import 'package:app/screens/aboutus.dart';
import 'package:app/screens/categories.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class NavigationBarButton extends StatefulWidget {
  const NavigationBarButton({super.key});

  @override
  State<NavigationBarButton> createState() => _NavigationBarButtonState();
}

class _NavigationBarButtonState extends State<NavigationBarButton> {
  int page_index = 0;
  final _pageOption = [
    Profile(),
    Home(),
    Categories(),
    AboutUS(),
    AboutApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[page_index],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
            icon: Icons.person,
          ),
          TabItem(
            icon: Icons.home,
          ),
          TabItem(
            icon: Icons.category,
          ),
          TabItem(icon: Icons.add_box_outlined),
          TabItem(
            icon: Icons.add_a_photo,
          ),
        ],
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        color: Colors.black,
        initialActiveIndex: page_index,
        onTap: (int index) {
          setState(() {
            page_index = index;
          });
        },
      ),
    );
  }
}
