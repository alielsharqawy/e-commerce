import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:app/models/user_model.dart';
import 'package:flutter/material.dart';

import '../widget/logo_image.dart';
import 'darkmood.dart';

class Profile extends StatelessWidget {


   UserModel? userModel  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Mydrawar(),
      appBar: AppBar(backgroundColor: Colors.amber,),
    );
  }
}
