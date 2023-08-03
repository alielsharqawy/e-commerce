// ignore_for_file: prefer_const_constructors
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
  // ignore: non_constant_identifier_names
  int page_index = 0;
  final _pageOption = [
    Home(),
    Categories(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[page_index],
      bottomNavigationBar: ConvexAppBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          TabItem(
            icon: Icons.category,
          ),
          TabItem(
            icon: Icons.home,
          ),
          TabItem(
            icon: Icons.person,
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
