import 'package:flutter/material.dart';

class MyAppBar {
  static myAppBar(String text) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
