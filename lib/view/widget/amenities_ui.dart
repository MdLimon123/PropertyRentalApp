import 'package:flutter/material.dart';

class AmenitiesUI extends StatefulWidget {
  String type;
  int startValue;
  Function decreaseValue;
  Function increaseValue;


   AmenitiesUI({
    super.key,
    required this.type,
    required this.startValue,
    required this.decreaseValue,
    required this.increaseValue});

  @override
  State<AmenitiesUI> createState() => _AmenitiesUIState();
}

class _AmenitiesUIState extends State<AmenitiesUI> {

  int? valueDigit;

  @override
  void initState() {
    super.initState();

    valueDigit = widget.startValue;

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.type,
        style: const TextStyle(
          fontSize: 18.0
        ),),

        Row(
          children: [
            IconButton(
                onPressed: (){
                  widget.decreaseValue;
                  valueDigit = valueDigit! -1;
                  if(valueDigit!< 0){
                    valueDigit = 0;
                  }
                  setState(() {

                  });
                },
                icon: const Icon(Icons.remove)),

            Text(valueDigit.toString(),
            style: const TextStyle(
              fontSize: 20.0
            ),),

            IconButton(
                onPressed: (){
                  widget.increaseValue;
                  valueDigit = valueDigit! + 1;
                  setState(() {

                  });
                },
                icon: const Icon(Icons.add)),

          ],
        )
      ],
    );
  }
}
