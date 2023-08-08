import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget defaultFormField({
  TextEditingController? controller,
  Function(String text)? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String hint,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  required double width,
  required BuildContext context,
  List<TextInputFormatter>? textInputFormatter,
  TextInputType? keyboardType,
}) =>
    BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Container(
          width: width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword,
            enabled: isClickable,
            onTap: () {},
            validator: (String? s) {
              return validate(s);
            },
            onChanged: onChange,
            inputFormatters: textInputFormatter,
            decoration: InputDecoration(
              fillColor: cubit.isdark ? Colors.white : Colors.white,
              filled: true,
              label: Text(hint),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15.0),
            ),
          ),
        );
      },
    );
