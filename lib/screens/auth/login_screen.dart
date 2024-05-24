import 'dart:convert';

import 'package:athang_expense_tracker/domain/repo/auth_repo.dart';
import 'package:athang_expense_tracker/plugins/http.dart';
import 'package:athang_expense_tracker/plugins/local_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../landing/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> loginUser() async {
    try {
      // final res =await http.post(
      //   Uri.parse('authentication'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      //   body: jsonEncode(<String, String>{
      //     // 'username': _username.text,
      //     'username': 'admin@expense.com',
      //     // 'password': _password.text
      //     'password': 'admin'
      //   }),
      // );
      AuthRepo().loginWithEmailAndPassword(_username.text, _password.text);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Image.asset('assets/images/logo.png',
                            height: 370, fit: BoxFit.contain)),
                    TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 99, 89, 240),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          loginUser();
                        },
                        child: Text('Login'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      margin: EdgeInsets.only(top: 8),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor: Color.fromARGB(255, 40, 4, 156)),
                        onPressed: () {},
                        child: Text('Don\'t have an account? Sign up.'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
