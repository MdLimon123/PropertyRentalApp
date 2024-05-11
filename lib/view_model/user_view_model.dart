import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:property_rental_app/model/app_constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserViewModel{

  signUp(email, password, firstName, lastName, city, country, bio, imageFileOfUser)async{

    Get.snackbar("Please wait", "we are creating account for you.");

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword
        (email: email, password: password)
          .then((result)async{

        String currentUserID = result.user!.uid;

        AppConstants.currentUser.id = currentUserID;
        AppConstants.currentUser.firstName = firstName;
        AppConstants.currentUser.lastName = lastName;
        AppConstants.currentUser.city = city;
        AppConstants.currentUser.country = country;
        AppConstants.currentUser.bio = bio;
        AppConstants.currentUser.email = email;
        AppConstants.currentUser.password = password;

        await saveUserToFirestore(bio, city, country, email, firstName, lastName, currentUserID)
            .whenComplete(()async{

          await addImageToFirestore(imageFileOfUser, currentUserID);

        });

        Get.snackbar("Congratulation", "your account has been created.");

      });

    }catch(e){
      Get.snackbar("Error", e.toString());
    }


  }

  Future<void> saveUserToFirestore(bio, city, country, email, firstName, lastName, id)async{

    Map<String, dynamic> dataMap = {

      "bio" :bio,
      "city": city,
      "country": country,
      "email": email,
      "firstName":firstName,
      "lastName":lastName,
      "isHost": false,
      "myPostingIDs":[],
      "savedPostingIDs":[],
      "earnings":0
    };

    await FirebaseFirestore.instance.collection("users").doc(id).set(dataMap);


  }

  addImageToFirestore(File imageFileOfUser,currentUserID)async{

    Reference referenceStorage = FirebaseStorage.instance.ref().
    child("userImages").
    child(currentUserID)
    .child(currentUserID + ".png");

    await referenceStorage.putFile(imageFileOfUser).whenComplete((){});

    AppConstants.currentUser.displayImage = MemoryImage(imageFileOfUser.readAsBytesSync());


    

  }

}