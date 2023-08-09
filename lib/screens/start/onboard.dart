// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:app/screens/login/login.dart';
import 'package:app/widget/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
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
  var controller = PageController();
  bool islast = false ;
  List<onbordingitems> screen = [
    onbordingitems(title:'Hello To Our Market' ,
      image: LogoImage() ,
      subtitle: "Let's Start",),
    onbordingitems(title:'Make Your Shopping Easy ' ,
      image: LogoImage() ,
      subtitle: "Discover Other World In E-commerce",),
    onbordingitems(title:"Let's Sign" ,
      image: LogoImage() ,
      subtitle: "",),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = UserCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cubit.isdark ? Colors.black : Colors.white,
          elevation: 0.0,
          actions: [
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginScreen(),));
            }, child: Text('Skip'))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index){
                    if(index == screen.length-1 ){
                      setState(() {
                        islast = true ;
                      });
                    }else{
                      setState(() {
                        islast = false ;
                      });
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  itemBuilder: (context, index) => onbordingitem(screen[index]),
                  itemCount: screen.length,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(controller: controller, count: screen.length,effect: ExpandingDotsEffect(
                      activeDotColor: Colors.amber ,
                      paintStyle: PaintingStyle.fill,
                      expansionFactor: 4.0,
                      spacing: 10
                  ),),
                  FloatingActionButton(onPressed: () {
                    if(islast == true){
                      Navigator.pushReplacement(context, PageTransition(type:PageTransitionType.rightToLeft , child:LoginScreen(),duration: Duration(milliseconds: 1300)));
                    }else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInOutCubicEmphasized);
                    }
                  },
                    child: Icon(Icons.arrow_forward_ios),

                  ),
                ],
              ),
              SizedBox(height: 25,)
            ],
          ),
        )
    );
        }
        );
  }
}

class onbordingitems {
  late Widget image ;
  late String title ;
  late String subtitle ;
  onbordingitems({required this.title , required this.subtitle,required this.image});
}

Widget onbordingitem(onbordingitems list) => Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child:Center(child: list.image)),
      Text(list.title,style: TextStyle(fontSize: 25)),
      SizedBox(height: 10,),
      Text(list.subtitle),
      SizedBox(height: 100,),
    ],
  ),
);
