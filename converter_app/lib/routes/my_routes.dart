import 'package:converter_app/core/components/bottom_nav.dart';
import 'package:converter_app/screens/on_boarding_page.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch(s.name){
      case "/":
        return MaterialPageRoute(builder: (ctx) => const OnBoarding());
      case "/tabbar":
        return MaterialPageRoute(builder: (ctx) => const MyTabBar());
    }
  }
}
