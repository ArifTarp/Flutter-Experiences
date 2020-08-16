import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerView extends StatefulWidget {
  CupertinoPickerView({Key key}) : super(key: key);

  @override
  _CupertinoPickerViewState createState() => _CupertinoPickerViewState();
}

class _CupertinoPickerViewState extends State<CupertinoPickerView> {
  GlobalKey<ScaffoldState> _key = GlobalKey(debugLabel: "scaffoldKey");

  var _operations = ["addition", "substraction", "multiplication", "division"];

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
        key: _key,
        body: Center(child: RaisedButton(onPressed: () {
          _key.currentState.showBottomSheet((context) => Container(
              height: 200,
              width: double.infinity,
              //child: _buildCupertinoPickerStatic(),
              // or
              child: _buildCupertinoPickerDynamic(),
              ));
        })));
    */

    // or

    return Scaffold(
        body: Center(
      child: CupertinoButton(
          child: Text("On press"),
          onPressed: () {
            showModalBottomSheet<int>(
                context: context,
                builder: (context) {
                  return _buildCupertinoPickerDynamic();
                });
          }),
    ));
  }

  CupertinoPicker _buildCupertinoPickerDynamic() {
    return CupertinoPicker(
      backgroundColor: Colors.grey[400],
      itemExtent: 40,
      children: new List<Widget>.generate(_operations.length, (index) {
        return Center(
            child: Text(
          "${_operations[index]}",
          style: TextStyle(fontSize: 25),
        ));
      }),
      onSelectedItemChanged: (val) {
        print(_operations[val]);
      },
    );
  }

  CupertinoPicker _buildCupertinoPickerStatic() {
    return CupertinoPicker(
      backgroundColor: Colors.grey[400],
      itemExtent: 40,
      children: [
        Center(
            child: Text(
          "1",
          style: TextStyle(fontSize: 25),
        )),
        Center(
            child: Text(
          "2",
          style: TextStyle(fontSize: 25),
        )),
        Center(
            child: Text(
          "3",
          style: TextStyle(fontSize: 25),
        )),
        Center(
            child: Text(
          "4",
          style: TextStyle(fontSize: 25),
        )),
        Center(
            child: Text(
          "5",
          style: TextStyle(fontSize: 25),
        ))
      ],
      onSelectedItemChanged: (val) {
        print(val);
      },
    );
  }
}
