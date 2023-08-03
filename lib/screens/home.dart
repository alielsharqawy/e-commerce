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
      drawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            ListTile(
              title: const Text("About The Application"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutApp()),
                );
              },
            ),
            ListTile(
              title: const Text("About Us"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUS()),
                );
              },
            ),
            ListTile(
              title: const Text("Dark Mode"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DarkMood()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
