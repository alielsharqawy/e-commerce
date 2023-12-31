import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_cubit/cubit/user_cubit/user_cubit.dart';
import '../data_cubit/states/user_states/user_state.dart';
import '../screens/about/aboutapp.dart';
import '../screens/about/aboutus.dart';
import '../screens/login/login.dart';

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cubit.isdark ? 'LightMode' : 'Dark Mode'),
                        Icon(cubit.isdark
                            ? Icons.brightness_4_outlined
                            : Icons.dark_mode),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutApp()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About The Application"),
                        Icon(Icons.info_rounded),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  AboutUS()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About Us"),
                        Icon(
                          Icons.group,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("log out"),
                        Icon(
                          Icons.logout,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
