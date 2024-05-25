import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_rental_app/view/hostScreens/create_posting_screen.dart';
import 'package:property_rental_app/view/widget/postion_list_tile.dart';

class MyPostingScreen extends StatefulWidget {

  const MyPostingScreen({super.key});

  @override
  State<MyPostingScreen> createState() => _MyPostingScreenState();
}

class _MyPostingScreenState extends State<MyPostingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(top: 25),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 0, 26, 26),
        child: InkResponse(
          onTap: (){
            Get.to(CreatePostingScreen(), transition: Transition.fadeIn);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.2
              )
            ),
            child: PostingListTile(),
          ),
        ),
      ),
    );
  }
}
