import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/logo_image.dart';
import 'darkmood.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email = "";

  Future<void> getemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? "no email";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getemail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Mydrawar(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 150, width: 150, child: LogoImage()),
            Text(
              "Email Address : $email",
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              "Email Address : $email",
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              "Email Address : $email",
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
