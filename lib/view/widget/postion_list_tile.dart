import 'package:flutter/material.dart';

class PostingListTile extends StatelessWidget {

  const PostingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 11.0,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add),
          Text("Create a listing",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
