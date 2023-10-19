import 'package:clot/data/products_provider.dart';
import 'package:clot/models/screen_arguments/product_details_screen_arguments.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments.dart';
import 'package:clot/screens/cart_screen.dart';
import 'package:clot/screens/categories_screen.dart';
import 'package:clot/screens/home_screen.dart';
import 'package:clot/screens/product_details_screen.dart';
import 'package:clot/screens/product_search_screen.dart';
import 'package:clot/screens/products_screen.dart';
import 'package:clot/screens/sign_in_screens/sign_in_first_step_screen.dart';
import 'package:clot/screens/sign_in_screens/sign_in_second_step_screen.dart';
import 'package:clot/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
    ],
    child: const ClotApp(),
  ));
}

class ClotApp extends StatefulWidget {
  const ClotApp({super.key});

  @override
  State<ClotApp> createState() => _ClotAppState();
}

class _ClotAppState extends State<ClotApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            title: 'Clot',
            theme: AppTheme().getTheme("light"),
            darkTheme: AppTheme().getTheme("dark"),
            initialRoute: HomeScreen.routeName,
            navigatorObservers: [HeroController()],
            routes: {
              SignInFirstStepScreen.routeName: (context) =>
                  const SignInFirstStepScreen(),
              SignInSecondStepScreen.routeName: (context) =>
                  const SignInSecondStepScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              CartScreen.routeName: (context) => const CartScreen(),
              CategoriesScreen.routeName: (context) => const CategoriesScreen(),
              ProductSearchScreen.routeName: (context) =>
                  const ProductSearchScreen(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == ProductsScreen.routeName) {
                final arguments = settings.arguments as ProductsScreenArguments;
                return MaterialPageRoute(
                  builder: (context) {
                    return ProductsScreen(arguments: arguments);
                  },
                );
              }

              if (settings.name == ProductDetailsScreen.routeName) {
                final arguments =
                    settings.arguments as ProductDetailsScreenArguments;
                return MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailsScreen(arguments: arguments);
                  },
                );
              }

              return null;
            },
          );
        },
      ),
    );
  }
}
