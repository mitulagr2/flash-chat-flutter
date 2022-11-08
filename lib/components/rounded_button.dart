import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.backgroundColor, @required this.onPressed, this.text});

  final Color backgroundColor;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
