import 'package:app/data/cubit/user_cubit/user_cubit.dart';
import 'package:app/data/states/user_states/user_state.dart';
import 'package:app/firebase_options.dart';
import 'package:app/screens/aboutapp.dart';
import 'package:app/screens/aboutus.dart';
import 'package:app/screens/start/splach.dart';
import 'package:app/widget/cach_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sharedhelper.init();
  bool isDark = sharedhelper.getBool(key: 'isDark') ?? false;
  print(isDark);
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserCubit()..changemode(shared: isDark),
        child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = UserCubit.get(context);
              return MaterialApp(
                theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    drawerTheme:
                        DrawerThemeData(backgroundColor: Colors.white54),
                    appBarTheme: AppBarTheme(
                      color: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.black,
                      unselectedItemColor: Colors.white,
                      backgroundColor: Colors.amber,
                    ),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber))),
                    progressIndicatorTheme: ProgressIndicatorThemeData(
                      color: Colors.amber,
                    )),
                darkTheme: ThemeData(
                    scaffoldBackgroundColor: Colors.black,
                    elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber))),
                    drawerTheme:
                        DrawerThemeData(backgroundColor: Colors.black26),
                    appBarTheme: AppBarTheme(
                      color: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.black,
                      backgroundColor: Colors.amber,
                    ),
                    progressIndicatorTheme: ProgressIndicatorThemeData(
                      color: Colors.amber,
                    ),
                    textTheme:
                        TextTheme(bodyMedium: TextStyle(color: Colors.white))),
                themeMode: cubit.isdark ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: SplachScreen(),
              );
            }));
  }
}
