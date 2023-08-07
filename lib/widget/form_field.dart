import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    Container(
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
          label: Text(hint),
          hintStyle:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.0),
        ),
      ),
    );
