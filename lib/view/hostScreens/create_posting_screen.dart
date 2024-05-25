import 'package:flutter/material.dart';

class CreatePostingScreen extends StatefulWidget {

  const CreatePostingScreen({super.key});

  @override
  State<CreatePostingScreen> createState() => _CreatePostingScreenState();
}

class _CreatePostingScreenState extends State<CreatePostingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: const Text("Create / Update a Listing",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.upload))
        ],
      ),
    );
  }
}
