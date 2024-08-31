import 'package:flutter/material.dart';

class BoarderButton extends StatelessWidget {
  String text;
  int index;
  Function onButtonClick;
  BoarderButton(
      {required this.text, required this.index, required this.onButtonClick});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              onButtonClick(index);
            },
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
