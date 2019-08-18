import 'package:flutter/material.dart';

class PrimaryActionButton extends StatelessWidget{

  Function onPressed;
  Widget child;

  PrimaryActionButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.black,
        textColor: Colors.white,
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}