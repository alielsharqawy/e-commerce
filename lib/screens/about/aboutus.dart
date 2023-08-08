// ignore_for_file: must_be_immutable
import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../start/navigationbar.dart';

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
                    builder: (BuildContext context) => NavigationBarButton(),
                  ),
                );
              },
            ),
          ),
          body: ListView.builder(
            itemCount: names.length,
            prototypeItem: ListTile(
              title: Text(
                names.first,
                style: TextStyle(
                    color: cubit.isdark ? Colors.white : Colors.black),
              ),
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  names[index],
                  style: TextStyle(
                      color: cubit.isdark ? Colors.white : Colors.black),
                ),
              );
            },
          ),
        );
      },
    );
  }
}