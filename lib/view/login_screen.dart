import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_rental_app/utils/app_constan.dart';
import 'package:property_rental_app/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email"
                      ),
                      style: const TextStyle(
                        fontSize: 24.0
                      ),
                      controller: _emailTextEditingController,
                      validator: (emailValue){
                        if(emailValue!.contains("@")){
                          return "Please write  valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Password"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _passwordController,
                      validator: (passwordValue){
                        if(passwordValue!.length<5){
                          return "Password must be at least 6 or more character";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(horizontal: 60)
                      ),
                        onPressed: (){},
                        child: const Text("Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),)),
                  ),
                  
                  TextButton(
                      onPressed: (){
                        Get.to(SignupScreen(),
                        transition: Transition.fadeIn);
                      },
                      child: const Text("Don't have an account? Create here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),))
                ],
              )),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      )
    );
  }
}
