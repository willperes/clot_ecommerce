import 'package:clot/screens/home_screen.dart';
import 'package:clot/screens/sign_in_screens/sign_in_first_step_screen.dart';
import 'package:clot/screens/sign_in_screens/sign_in_second_step_screen.dart';
import 'package:clot/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Clot',
        theme: AppTheme().getTheme("light"),
        darkTheme: AppTheme().getTheme("dark"),
        initialRoute: HomeScreen.routeName,
        routes: {
          SignInFirstStepScreen.routeName: (context) =>
              const SignInFirstStepScreen(),
          SignInSecondStepScreen.routeName: (context) =>
              const SignInSecondStepScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
