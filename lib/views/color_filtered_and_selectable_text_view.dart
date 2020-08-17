import 'package:flutter/material.dart';

class ColorFilteredAndSelectableTextView extends StatelessWidget {
  const ColorFilteredAndSelectableTextView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColorFiltered(
      //colorFilter: ColorFilter.mode(Colors.red, BlendMode.color),
      //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorDodge),
      //colorFilter: ColorFilter.mode(Colors.red, BlendMode.modulate),
      //colorFilter: ColorFilter.mode(Colors.red, BlendMode.screen),
      colorFilter: ColorFilter.mode(Colors.red, BlendMode.softLight),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color Filtered"),
          Text("And"),
          SelectableText("Selectable Text",style: TextStyle(fontSize: 40),),
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.android,
            color: Colors.green,
            size: 100,
          )
        ],
      )),
    ));
  }
}
