import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:app/screens/login/register.dart';
import 'package:app/screens/start/navigationbar.dart';
import 'package:app/widget/cach_helper.dart';
import 'package:app/widget/logo_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationBarButton(),
              ));
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
                key: _formKey,
                child: Column(children: [
                  Container(
                    height: 170,
                    width: 170,
                    child: LogoImage(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: cubit.isdark ? Colors.white : Colors.white,
                          hintText: "Email"),
                      validator: (value) {
                        if (value!.contains("@")) {
                          return null;
                        } else {
                          return "add valid email";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: passController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: cubit.isdark ? Colors.white : Colors.white,
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please enter Valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool result = await firebaselogin(
                              emailController.text, passController.text);
                          if (result) {
                          sharedhelper.putString(key: 'email', value: emailController.text);
                          sharedhelper.putString(key: 'pass', value: passController.text);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationBarButton()),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('add valid account')),
                            );
                          }
                        }
                      },
                      child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 25,
                                color:
                                    cubit.isdark ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "No Account? Sign Up",
                      style: TextStyle(fontSize: 25, color: Colors.amber),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> firebaselogin(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}
