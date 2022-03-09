import 'package:my_kundalik/core/components/input_comp.dart';
import 'package:my_kundalik/core/constants/const.dart';
import 'package:my_kundalik/data/user_info.dart';
import 'package:my_kundalik/widgets/app_bar.dart';
import 'package:my_kundalik/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:my_kundalik/routes/my_route.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar("Sign in"),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          child: Padding(
            padding: PaddingMarginConst.kLargePadding,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputComp.inputDecoration(
                      hintText: "Username Kiriting...",
                      labelText: "Username...",
                      suffixIcon: const Icon(Icons.edit),
                    ),
                    validator: (text) {
                      if (text!.length < 5) {
                        return "Username 5 ta belgidan kam bo'lmasin !";
                      }
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputComp.inputDecoration(
                      hintText: "Passwors Kiriting...",
                      labelText: "Password...",
                      suffixIcon: const Icon(Icons.password),
                    ),
                    validator: (text) {
                      if (text!.length < 5) {
                        return "Password 5 ta belgidan kam bo'lmasin !";
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConst.kPrimaryColor,
        child: const Icon(Icons.chevron_right),
        onPressed: signIn,
      ),
    );
  }

  signIn() {
    if (_formKey.currentState!.validate()) {
      for (Map userpass in UserInfo.users) {
        if (userpass.keys.first == _usernameController.text &&
            userpass.values.first == _passwordController.text) {
          Navigator.pushReplacementNamed(
            context,
            '/score',
            arguments: _usernameController.text,
          );
          return true;
        }
      }
      MyMessenger.showMyMessenger("Username yoki password notogri !!", context);
    }
  }
}