import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_cubit/cubit/user_cubit/user_cubit.dart';
import '../data_cubit/states/user_states/user_state.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  final String? txt;
  final String? value;
  bool isTapped = false;

  MyButton(this.txt, this.value);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: widget.isTapped ? 50 : 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isTapped = !widget.isTapped;
                    });
                  },
                  child: Text(widget.txt!),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: widget.isTapped ? 1.0 : 0.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      widget.value!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: cubit.isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
