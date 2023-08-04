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
            backgroundColor:Colors.black,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.amber,
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