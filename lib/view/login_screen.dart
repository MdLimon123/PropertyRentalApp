import 'package:flutter/material.dart';
import 'package:property_rental_app/utils/app_constan.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.amber
                ],
                begin: FractionalOffset(0,0),
                end: FractionalOffset(1,0),
                stops: [0,1],
                tileMode: TileMode.clamp
            )
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(AppConstnac.loginImage),

                const Text("Hello Friends\n welcome back",

                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,)
              ],
            ),
          ],
        ),
      )
    );
  }
}
