import 'package:converter_app/routes/my_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoutes _myRoutes = MyRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _myRoutes.onGenerateRoute,
      initialRoute: "/",
    );
  }
}
