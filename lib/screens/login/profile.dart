import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:app/widget/cach_helper.dart';
import 'package:app/widget/profile%20botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/MyDrawar.dart';
import '../../widget/logo_image.dart';


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? email = sharedhelper.getString(key: 'email');
  String? pass = sharedhelper.getString(key: 'pass');


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          endDrawer: Mydrawar(),
          appBar: AppBar(
            backgroundColor: Colors.amber,
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 170,
                    width: 170,
                    child: LogoImage(),
                  ),
                ),
                MyButton('Email', email),
                SizedBox(
                  height: 15,
                ),
               MyButton('Password', pass),
                SizedBox(
                  height: 15,
                ),
                MyButton('City', 'AlMansoura'),
              ],
            ),
          ),
        );
      },
    );
  }
}
