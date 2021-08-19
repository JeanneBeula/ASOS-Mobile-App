import 'package:asos_mobile_app/screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameTextEditingController =
      TextEditingController();

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  final TextEditingController passwordTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isBusy = false;
  bool _passwordVisible = false;

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
                controller: nameTextEditingController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'My name',
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ("please_enter_your_name");
                  }
                  return null;
                },
              ),
            ),
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
                controller: phoneNumberTextEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '078777777',
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ("please_enter_your_phoneNumber");
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: TextFormField(
                controller: passwordTextEditingController,
                obscureText: !_passwordVisible,
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
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content:
                                        Text("Account Created Successfully"),
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
