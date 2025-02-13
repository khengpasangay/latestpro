import 'package:athang_expense_tracker/base/style/text_styles.dart';
import 'package:athang_expense_tracker/screens/auth/login_screen.dart';
import 'package:athang_expense_tracker/screens/landing/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../plugins/local_shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkIfUserIsLoggedIn();
  }

  Future<void> checkIfUserIsLoggedIn() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await getTokenFromLocalStorage();
    print('inside method');
    print(token);
    if (token != '') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ',
              textAlign: TextAlign.center,
              style: TypoStyles().kPageHeader,
            ),
            Text(
              'To My World',
              textAlign: TextAlign.center,
              style: TypoStyles().kPageHeader,
            ),
          ],
        ),
      ),
    ));
  }
}
