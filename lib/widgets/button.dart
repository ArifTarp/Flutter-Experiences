import 'package:flutter/material.dart';

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => print("deneme"),
      child: Text("Flat Button Test".toUpperCase()),
      textColor: Colors.redAccent[700],
      //color: Colors.redAccent[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.redAccent[700])),
    );
  }
}

class ButtonTestTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => print("deneme"),
      child: Text("Raised Button Test".toUpperCase()),
      textColor: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.blueAccent[700])),
    );
  }
}
