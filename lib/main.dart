import 'package:clot/screens/products_screen.dart';
import 'package:clot/screens/sign_in/sign_in_first_step.dart';
import 'package:clot/screens/sign_in/sign_in_second_step.dart';
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
        theme: AppTheme().theme,
        initialRoute: SignInFirstStep.routeName,
        routes: {
          SignInFirstStep.routeName: (context) => const SignInFirstStep(),
          SignInSecondStep.routeName: (context) => const SignInSecondStep(),
          ProductsScreen.routeName: (context) => const ProductsScreen(),
        },
      ),
    );
  }
}
