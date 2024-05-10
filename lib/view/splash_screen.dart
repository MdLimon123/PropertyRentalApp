import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_rental_app/utils/app_constan.dart';
import 'package:property_rental_app/view/login_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(const Duration(seconds: 5), (){

      Get.to(LoginScreen(),
      transition: Transition.fadeIn);
    });

    super.initState();
  }

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
        child: Column(
          children: [
            
            Image.asset(AppConstnac.splashImage),

            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("Property Rental",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.center,),
            )

          ],
        ),
      ),
    );
  }
}
