import 'package:flutter/material.dart';
import 'package:property_rental_app/model/app_constants.dart';
import 'package:property_rental_app/utils/app_constan.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // user info
            Padding(padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(
              child: Column(
                children: [

                  // image

                  MaterialButton(onPressed: (){},
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width / 4.5,
                      child: CircleAvatar(
                        backgroundImage: AppConstants.currentUser.displayImage,
                        radius: MediaQuery.of(context).size.width/4.5,
                        
                      ),
                    ),

                  ),
                  
                  const SizedBox(height: 10,),

                  // name and email
                  Column(
                    children: [
                      Text(AppConstants.currentUser.getFullNameOfUser(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),

                      Text(AppConstants.currentUser.email.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  )

                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
