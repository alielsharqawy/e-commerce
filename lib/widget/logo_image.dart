import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_cubit/cubit/user_cubit/user_cubit.dart';
import '../data_cubit/states/user_states/user_state.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  final String dark = "assets/D-logo.png";
  final String light = "assets/L-logo.png";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: cubit.isdark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(50)),
            child: Image.asset(cubit.isdark ? dark : light),
          );
        });
  }
}
