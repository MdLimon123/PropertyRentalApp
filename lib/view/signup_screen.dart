import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_rental_app/global.dart';
import 'package:property_rental_app/utils/app_constan.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? imageFileOfUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pinkAccent, Colors.amber],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(1, 0),
                    stops: [0, 1],
                    tileMode: TileMode.clamp))),
        title: const Text("Create new account",
        style: TextStyle(
          color: Colors.white
        ),),
      ),

      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.amber],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(1, 0),
                  stops: [0, 1],
                  tileMode: TileMode.clamp)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Image.asset(AppConstnac.signupImage,width: 250,),
            ),
            
            const Text("Tell us about you",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink
            ),
            textAlign: TextAlign.center,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _emailController,
                      validator: (emailValue){
                        if(emailValue!.contains("@")){
                          return "Please write  valid email";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Password"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (passwordValue){
                        if(passwordValue!.length<5){
                          return "Password must be at least 6 or more character";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "First Name"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _firstNameController,
                      validator: (text){
                        if(text!.isEmpty){
                          return "Please write  your first name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Last Name"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _lastNameController,
                      validator: (text){
                        if(text!.isEmpty){
                          return "Please write  your last name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "City"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _cityController,
                      validator: (text){
                        if(text!.isEmpty){
                          return "Please write  your city name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Country"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _countryController,
                      validator: (text){
                        if(text!.isEmpty){
                          return "Please write  your country name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Bio"
                      ),
                      style: const TextStyle(
                          fontSize: 24.0
                      ),
                      controller: _bioController,
                      validator: (text){
                        if(text!.isEmpty){
                          return "Please write  your bio";
                        }
                        return null;
                      },
                      maxLines: 5,
                    ),
                  ),

                ],
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: MaterialButton(onPressed: ()async{

                var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if(imageFile !=null){
                  imageFileOfUser = File(imageFile.path);

                  setState(() {
                    imageFileOfUser;
                  });
                }

              },
              child: imageFileOfUser == null ?
                const Icon(Icons.add_a_photo)
                :CircleAvatar(
                backgroundColor: Colors.pink,
                radius: MediaQuery.of(context).size.width/5.0,
                child: CircleAvatar(
                  backgroundImage: FileImage(imageFileOfUser!),
                  radius: MediaQuery.of(context).size.width/5.0,
                ),
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 44.0, right: 60.0, left: 60.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,

                  ),
                  onPressed: (){

                    if(_formKey.currentState!.validate() || imageFileOfUser == null){
                      Get.snackbar("Field Missing", "Please choose image and fill out complete sign up form.");
                      return;
                    }
                    if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                      Get.snackbar("Field Missing", "Please c fill out complete sign up form.");
                      return;
                    }

                    userViewModel.signUp(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _firstNameController.text.trim(),
                      _lastNameController.text.trim(),
                      _cityController.text.trim(),
                      _countryController.text.trim(),
                      _bioController.text.trim(),
                        imageFileOfUser

                    );

                  },
                  child: const Text("Create Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),)),
            ),

            const SizedBox(height: 40,)
          ],
        ),
      )
    );
  }
}
