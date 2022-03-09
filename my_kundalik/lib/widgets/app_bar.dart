import 'package:flutter/material.dart';
import 'package:my_kundalik/core/constants/const.dart';

class MyAppBar {
  static appBar(String name) => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "$name",
          style: TextStyle(
            color: ColorConst.kPrimaryColor,
          ),
        ),
      );
}
