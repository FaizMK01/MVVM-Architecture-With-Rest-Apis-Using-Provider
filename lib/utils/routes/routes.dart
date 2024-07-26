import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/route_names.dart';
import 'package:mvvm_with_provider/view/home_screen.dart';
import 'package:mvvm_with_provider/view/login_screen.dart';
import 'package:mvvm_with_provider/view/signup_screen.dart';
import 'package:mvvm_with_provider/view/splash_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          ),
        );
    }
  }
}
