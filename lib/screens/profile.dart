import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'darkmood.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});

  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Scaffold(
              backgroundColor: cubit.isdark ? Colors.black : Colors.white,
              endDrawer: Mydrawar(),
              appBar: AppBar(
                backgroundColor: Colors.amber,
              ),
              body: Column(
                children: [
                  Text("${userModel!.email}"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${userModel!.password}"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${userModel!.uId}"),
                ],
              ));
        },
      ),
    );
  }
}
