import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widgets/shadow_widget.dart';

class StatelessRaisedButton extends StatelessWidget {
  const StatelessRaisedButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {},
        child: ShadowWidget(
          child: Container(
            child: Text("Tutorial Raised Button"),
          ),
          elevation: 50,
          color: Colors.black,
        ));
  }
}

class StatelessText extends StatelessWidget {
  const StatelessText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShadowWidget(
        child: Text(
          "Settings",
          style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontFamily: "FrederickatheGreat",
              fontStyle: FontStyle.normal,
              fontSize: 30),
        ),
        color: Colors.tealAccent,
      ),
    );
  }
}
