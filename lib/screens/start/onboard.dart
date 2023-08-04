// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:app/screens/login/login.dart';
import 'package:app/widget/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data_cubit/cubit/user_cubit/user_cubit.dart';
import '../../data_cubit/states/user_states/user_state.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ignore:
  PageController MyController = PageController();
  bool Islastpage = false;
  @override
  void dispose() {
    MyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = UserCubit.get(context);
    return Scaffold(
      body: Container(
        color: cubit.isdark? Colors.black : Colors.white,
        padding: EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: MyController,
          onPageChanged: (index) {
            setState(() {
              Islastpage = index == 1;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            LogoImage(),
            LogoImage(),
          ],
        ),
      ),
      bottomSheet: Islastpage
          ? ElevatedButton( 
         
        style: ButtonStyle
          (
          shape: MaterialStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
          fixedSize: MaterialStatePropertyAll(Size(double.maxFinite,80)),
          backgroundColor: MaterialStatePropertyAll(cubit.isdark? Colors.black : Colors.white),
            elevation: MaterialStatePropertyAll(0)
            ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
                child: Text(
                  "LET'S START!",
                  style:TextStyle(color: cubit.isdark? Colors.white : Colors.black, ),
                ),

            )
          : Container(
              color: cubit.isdark? Colors.black : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => {
                      MyController.jumpToPage(1),
                    },
                    child: Text("Skip", style: TextStyle(color: Colors.grey)),
                  ),
                  SmoothPageIndicator(
                    controller: MyController, // PageController
                    count: 2,
                    effect: const WormEffect(
                      spacing: 25,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.blue,
                    ),
                    onDotClicked: (index) => MyController.animateToPage(
                      index,
                      duration: const Duration(
                        milliseconds: 5,
                      ),
                      curve: Curves.easeInQuad,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      MyController.nextPage(
                        duration: const Duration(microseconds: 5),
                        curve: Curves.easeInOut,
                      ),
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
    );
        }
        );
  }
}
