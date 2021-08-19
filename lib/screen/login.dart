import 'package:asos_mobile_app/screen/join.dart';
import 'package:asos_mobile_app/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailTextEditingController =
      TextEditingController();

  final TextEditingController passwordTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isBusy = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: TextFormField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'name@gmail.com',
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ("please_enter_your_email");
                  }
                  if (!value.validateEmail()) {
                    return ("not_valid");
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ("please_enter_your_password");
                  }
                  if (value.length < 6) {
                    return ("least_6_characters");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isBusy
                      ? CircularProgressIndicator()
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff7879f1),
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              onPressed: () async {
                                if (isLoading) {
                                  return;
                                }
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                setState(() {
                                  isBusy = false;
                                });
                              },
                              child: Text(
                                "signin",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "You don’t have an account?",
                    style: TextStyle(color: Colors.black.withOpacity(.42)),
                  ),
                  InkWell(
                    onTap: isBusy || isLoading
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JoinApp(),
                              ),
                            );
                          },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xff7879f1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
