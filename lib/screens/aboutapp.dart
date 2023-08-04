import 'package:app/data/cubit/user_cubit/user_cubit.dart';
import 'package:app/data/states/user_states/user_state.dart';
import 'package:app/screens/start/navigationbar.dart';
import 'package:app/widget/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          backgroundColor: cubit.isdark ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.amber,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const NavigationBarButton(),
                  ),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                      height: 300, width: double.infinity, child: LogoImage()),
                  ListTile(
                    title: Text(
                      "Dear user, we offer you a new application in the world of e-commerce to facilitate your buying and selling operations. In our application, we offer you a comprehensive e-market for all the products you need, which facilitates exchanges through websites and saves time and effort. One of the most important features of the application is the simple design, and we have been keen to provide dark-mode system In our app to protect your eyes, provide for creating a new account on the application, which documents the operations that you perform. There is a special page for displaying categories, and there is another page for displaying products, and then we will transfer you to the other world in e-marketing operations through our application.",
                      style: TextStyle(
                          fontSize: 17,
                          color: cubit.isdark ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
