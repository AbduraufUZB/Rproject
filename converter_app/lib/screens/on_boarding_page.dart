import 'dart:async';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/tabbar");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://media.istockphoto.com/vectors/fast-coin-dollar-icon-stock-vector-vector-id1147134875?k=20&m=1147134875&s=612x612&w=0&h=FP8cBAEprTnI16VG1vpbWpLQ_4o0A8qI39otI2bSroI="),
            ),
          ),
          const Text(
            "Currency",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
