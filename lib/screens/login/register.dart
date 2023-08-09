import 'package:app/data_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:app/screens/login/login.dart';
import 'package:app/screens/start/navigationbar.dart';
import 'package:app/widget/logo_image.dart';
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
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      width: 170,
                      child: LogoImage(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                cubit.isdark ? Colors.white : Colors.white,
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
                        obscureText :true,
                        keyboardType: TextInputType.number,
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            UserCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passController.text);
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 25,
                                color:
                                    cubit.isdark ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        {
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Have Account? Sign In",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
//  Container(
//                       clipBehavior: Clip.hardEdge,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20)),
//                       width: 300,
//                       child: MaterialButton(
//                         height: 40,
//                         minWidth: double.infinity,
//                         elevation: 10.0,
//                         color: Colors.amber,
//                         onPressed: () async {
//                          
//                         },
//                         child: Text(
//                           "register",
//                           style: TextStyle(
//                               fontSize: 25,
//                               color: cubit.isdark ? Colors.black : Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),