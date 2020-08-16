import 'package:flutter/material.dart';

class DropDownView extends StatefulWidget {
  DropDownView({Key key}) : super(key: key);

  @override
  _DropDownViewState createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  int _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: DropdownButton<int>(
            value: _selectedValue,
            hint: Text("Select Item"),
            items: [
              DropdownMenuItem(
                child: Text("Item 1"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Item 2"),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("Item 3"),
                value: 3,
              )
            ],
            onChanged: (val) {
              setState(() {
                _selectedValue = val;
              });
            }),
      ),
    );
  }
}
