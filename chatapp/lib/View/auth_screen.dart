import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  String? enteredEmail;
  String? enteredPassword;
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;

  submitValues() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('entered email address: $enteredEmail entered password $enteredPassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Image.asset('images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(16),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 16,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Enter Email address to login';
                              }
                            },
                            onSaved: (value) {
                              enteredEmail = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.length < 6) {
                                return 'Password must be 6 characters long';
                              }
                            },
                            onSaved: (value) {
                              enteredPassword = value;
                            },
                          ),
                          ElevatedButton(
                              onPressed: () {
                                submitValues();
                              },
                              child: Text(
                                _isLogin ? 'Login' : 'Signup',
                                style: TextStyle(color: Colors.purple),
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                  _isLogin
                                      ? 'Create an account'
                                      : 'I already have an account',
                                  style: TextStyle(color: Colors.purple)))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
