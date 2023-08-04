import 'package:app/data/cubit/user_cubit/user_cubit.dart';
import 'package:app/data/states/user_states/user_state.dart';
import 'package:app/screens/start/navigationbar.dart';
import 'package:app/widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccesState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavigationBarButton()));
        }
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          backgroundColor: cubit.isdark ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor: cubit.isdark ? Colors.black : Colors.white,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(children: [
                  Image.asset(
                    "assets/logo.jpg",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  defaultFormField(
                      controller: emailController,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "Email is not correct";
                        }
                      },
                      hint: "E-mail",
                      width: double.infinity,
                      context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      controller: passController,
                      validate: (String value) {
                        if (value.length < 6) {
                          return "Password must be 6 numbers ";
                        }
                      },
                      hint: "Password",
                      width: double.infinity,
                      context: context),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    elevation: 10.0,
                    color: Colors.blue,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        UserCubit.get(context).userRegister(
                            email: emailController.text,
                            password: passController.text);
                      }
                    },
                    child: const Text(
                      "register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}