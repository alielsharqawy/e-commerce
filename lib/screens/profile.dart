import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/logo_image.dart';
import 'darkmood.dart';

class Profile extends StatefulWidget {
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
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                child: LogoImage(),
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "Email : ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                Expanded(
                  flex: 4,
                  child: Text(
                    "$email",
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "City : ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Mansoura",
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
