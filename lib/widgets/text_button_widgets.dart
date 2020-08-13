import 'package:flutter/material.dart';

class TutorialText extends StatelessWidget {
  const TutorialText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Settings",
        style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontFamily: "FrederickatheGreat",
            fontStyle: FontStyle.normal,
            fontSize: 30),
      ),
    );
  }
}

class TutorialRaisedButton extends StatelessWidget {
  const TutorialRaisedButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text("Tutorial Raised Button"),
      textColor: Colors.orange,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class TutorialFlatButton extends StatelessWidget {
  const TutorialFlatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text("Tutorial Flat Button"),
      textColor: Colors.orange,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class TutorialFloatingActionButton extends StatelessWidget {
  const TutorialFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.notifications),
    );
  }
}

class TutorialOutlineButton extends StatelessWidget {
  const TutorialOutlineButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      child: Icon(Icons.notifications),
    );
  }
}

class TutorialRaisedButtonTwo extends StatelessWidget {
  const TutorialRaisedButtonTwo({Key key}) : super(key: key);

  void onPress() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () => onPress(),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
