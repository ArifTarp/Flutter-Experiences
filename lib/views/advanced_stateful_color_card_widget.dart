import 'package:flutter/material.dart';

class ColorCardWidget extends StatefulWidget {
  const ColorCardWidget({Key key, this.onChanged})
      : super(key: key);

  final Function(Color color) onChanged;

  @override
  _ColorCardWidgetState createState() => _ColorCardWidgetState();
}

class _ColorCardWidgetState extends State<ColorCardWidget> {

  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      color: _color,
      child: ListTile(
        title: Text("Change Color"),
        subtitle: Text("Color"),
        trailing: DropdownButton<Color>(items: [
          DropdownMenuItem(
            child: Text("Red"),
            value: Colors.red,
          ),
          DropdownMenuItem(
            child: Text("Green"),
            value: Colors.green,
          ),
          DropdownMenuItem(
            child: Text("Blue"),
            value: Colors.blue,
          ),
        ], onChanged: (value){
          setState(() {
            _color = value;
          });
          widget.onChanged(_color);
        }),
      ),
    );
  }
}
