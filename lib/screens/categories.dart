import 'package:flutter/material.dart';

import 'darkmood.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Mydrawar(),
      appBar: AppBar(backgroundColor: Colors.amber,),
    );
  }
}