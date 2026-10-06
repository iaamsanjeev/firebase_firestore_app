import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/functions/authFunctions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Loginscreen"),
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !isLogin
                ? TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value.toString().length < 3) {
                        return 'Username is so small';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        username = newValue!;
                      });
                    },
                    decoration: InputDecoration(hintText: "Enter username"),
                  )
                : Container(),
            TextFormField(
              key: ValueKey('email'),
              decoration: InputDecoration(hintText: "Enter email"),
              validator: (value) {
                if (!(value.toString().contains('@'))) {
                  return 'email is invalid';
                }
                return null;
              },
              onSaved: (newValue) {
                setState(() {
                  email = newValue!;
                });
              },
            ),
            TextFormField(
              obscureText: true,
              key: ValueKey('password'),
              decoration: InputDecoration(hintText: "Enter password"),
              validator: (value) {
                if (value.toString().length < 6) {
                  return 'Password is so small';
                }
                return null;
              },
              onSaved: (newValue) {
                setState(() {
                  password = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.zero,
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                 isLogin ? signin(email, password) :  signup(email, password);
                  }
                },
                child: Text(
                  isLogin ? " Login" : "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: isLogin
                  ? Text("Don't have an account")
                  : Text(
                      "Already Signed Up? Login",
                      style: TextStyle(color: Colors.purple[300]),
                    ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
