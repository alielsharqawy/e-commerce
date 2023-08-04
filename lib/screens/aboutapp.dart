import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
         
      body: Center(
          child: ListTile(
        title: Text("Dear user, we offer you a new application in the world of e-commerce to facilitate your buying and selling operations. In our application, we offer you a comprehensive e-market for all the products you need, which facilitates exchanges through websites and saves time and effort. One of the most important features of the application is the simple design, and we have been keen to provide dark-mode system In our app to protect your eyes, provide for creating a new account on the application, which documents the operations that you perform. There is a special page for displaying categories, and there is another page for displaying products, and then we will transfer you to the other world in e-marketing operations through our application.",
      ),)),
    );
  }
}
