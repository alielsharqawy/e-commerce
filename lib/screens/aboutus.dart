import 'package:app/screens/start/navigationbar.dart';
import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  List<String> names = [
    "Ali Elsayed",
    "Ahmed Hossam",
    "Ahmed Adel",
    "khaled Mohamed",
    "Amr Adel"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NavigationBarButton(),
                ),
              );
            },
          ),
        ),
        body: ListView.builder(
      itemCount: names.length,
      prototypeItem: ListTile(
        title: Text(names.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(names[index]),
        );
      },
    ));
  }
}
//  element.length;
//         print(element);