import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oqtepa_app/core/constants/const.dart';
import 'package:oqtepa_app/data/change_language.dart';
import 'package:oqtepa_app/widgets/my_appbar.dart';
import 'package:oqtepa_app/widgets/mytext_widget.dart';
import 'package:oqtepa_app/widgets/scaffold_messanger.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _valueSwitch = false;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  int _stepnum = 0;

  late int m = Random().nextInt(1000) + 8999;

  bool _isactive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myAppBar(ChangeLan.changelanguage[ChangeLan.index][0]),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingMarginConst.kLargePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                text: ChangeLan.changelanguage[ChangeLan.index][3],
                size: 18,
                fontWeight: WeightConst.kMediumWeight),
            _changeLanguage(),
            MyText(
                text: ChangeLan.changelanguage[ChangeLan.index][0],
                size: 20,
                fontWeight: WeightConst.kMediumWeight),
            Stepper(
              onStepContinue: () {
                if (_formKey.currentState!.validate()) {
                  if (_stepnum != 1) {
                    _stepnum += 1;
                    MyMessenger.showMyMessenger(
                        "${ChangeLan.changelanguage[ChangeLan.index][6]}$m",
                        context);
                    _isactive = true;
                  } else if (_formKey2.currentState!.validate() &&
                      _stepnum == 1) {
                    Navigator.pushReplacementNamed(context, "/homepage");
                  }
                }
                setState(() {});
              },
              onStepCancel: () {
                if (_stepnum != 0) {
                  _stepnum -= 1;
                  _isactive = false;
                }
                setState(() {});
              },
              currentStep: _stepnum,
              steps: _steps,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width*0.7,
                child: const Image(
                  image: AssetImage("assets/images/on_boarding.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> get _steps => [
        Step(
          isActive: true,
          title: Text(ChangeLan.changelanguage[ChangeLan.index][1]),
          content: Padding(
            padding: PaddingMarginConst.kMediumPadding,
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (v) {
                  if (v!.length != 9) {
                    return ChangeLan.changelanguage[ChangeLan.index][4];
                  }
                },
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: ChangeLan.changelanguage[ChangeLan.index][1],
                    prefixText: "+998 "),
              ),
            ),
          ),
        ),
        Step(
          isActive: _isactive,
          title: Text(ChangeLan.changelanguage[ChangeLan.index][5]),
          content: Form(
            key: _formKey2,
            child: TextFormField(
              validator: (v) {
                print(v);
                print(m);
                if (int.parse(v!) != m) {
                  return ChangeLan.changelanguage[ChangeLan.index][7];
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: ChangeLan.changelanguage[ChangeLan.index][6],
              ),
            ),
          ),
        ),
      ];

  _changeLanguage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(text: "O'zbek", size: 15),
        Switch(
          activeColor: Colors.red,
          value: _valueSwitch,
          onChanged: (b) {
            _valueSwitch = !_valueSwitch;
            _valueSwitch == true ? ChangeLan.index = 1 : ChangeLan.index = 0;
            setState(() {});
          },
        ),
        MyText(text: "English", size: 15),
      ],
    );
  }
}
