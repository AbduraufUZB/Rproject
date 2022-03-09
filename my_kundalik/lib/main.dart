import 'package:flutter/material.dart';
import 'routes/my_route.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute _myRoute = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kundalik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _myRoute.onGenerateRoute,
      initialRoute: '/',
    );
  }
}

