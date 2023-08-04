import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cubit/user_cubit/user_cubit.dart';
import '../data/states/user_states/user_state.dart';
import 'aboutapp.dart';
import 'aboutus.dart';
import 'login/login.dart';

class Mydrawar extends StatelessWidget {
  const Mydrawar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Drawer(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    cubit.changemode();
                  },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cubit.isdark? 'LightMode' :'Dark Mode'  ),
                      Icon(cubit.isdark? Icons.brightness_4_outlined: Icons.dark_mode  ),
                    ],),),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutApp()));
                  }, child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("About The Application"),
                      Icon(Icons.info_rounded),
                    ],), ),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUS()),
                    );
                  }, child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About Us"),
                    Icon(Icons.group,),
            ],),  ),ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  }, child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("log out"),
                      Icon(Icons.logout,),
                    ],),  )


                ],
              ),
            ),
          );
        });
  }
}