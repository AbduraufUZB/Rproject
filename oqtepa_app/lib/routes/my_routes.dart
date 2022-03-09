import 'package:flutter/material.dart';
import 'package:oqtepa_app/screens/home_page.dart';
import 'package:oqtepa_app/screens/onboarding.dart';
import 'package:oqtepa_app/screens/sign_up.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case "/":
        return MaterialPageRoute(builder: (ctx) => const OnBoardingPage(),);
      case "/signup":
        return MaterialPageRoute(builder: (ctx) => const SignUpPage(),);
      case "/homepage":
        return MaterialPageRoute(builder: (ctx) => const HomePage(),);
    }
  }
}
