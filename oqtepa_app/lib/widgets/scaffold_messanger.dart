import 'package:flutter/material.dart';
import 'package:oqtepa_app/core/constants/const.dart';

class MyMessenger {
  static showMyMessenger(String text, BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorConst.kFacebook,
          content: Text(text),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
}