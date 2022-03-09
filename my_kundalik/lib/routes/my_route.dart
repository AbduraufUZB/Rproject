import 'package:my_kundalik/screens/home_page.dart';
import 'package:my_kundalik/screens/score_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case '/score':
        return MaterialPageRoute(
            builder: (context) => ScorePage(username: (args as String)));
    }
  }
}