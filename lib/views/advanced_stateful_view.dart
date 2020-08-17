import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/advanced_stateful_color_card_widget.dart';
import 'package:http/http.dart' as http;

class AdvancedStatefulView extends StatefulWidget {
  AdvancedStatefulView({Key key}) : super(key: key);

  @override
  _AdvancedStatefulViewState createState() => _AdvancedStatefulViewState();
}

class _AdvancedStatefulViewState extends State<AdvancedStatefulView> {
  Color _selectedColor;
  int _selectedIndex;
  List<ColorBase> _colors;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _colors = List<ColorBase>();
    for (var i = 0; i < 15; i++) {
      _colors.add(ColorBase(color: Colors.white));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _getData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return _buildListViewThirdWay();
                  } else {
                    return Center(child: Text("Not Found Data"));
                  }
                  break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                default:
                  return Center(child: Text("error"));
              }
            }));
  }

  Future get _getData async {
    return (await http.get("https://my-custom-api-b0af8.firebaseio.com/.json"))
        .body;
  }

  ListView _buildListViewThirdWay() {
    return ListView.builder(
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return ColorCardWidget(
            onChanged: (value) {
              _colors[index].color = value;
            },
          );
        });
  }

  /*ListView _buildListViewSecondWay() {
    return ListView.builder(
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            color: _colors[index].color,
            child: ListTile(
              title: Text("Change Color"),
              subtitle: Text("Color"),
              trailing: DropdownButton<Color>(
                  items: [
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
                  ],
                  onChanged: (value) {
                    setState(() {
                      _colors[index].color = value;
                    });
                  }),
            ),
          );
        });
  }

  ListView _buildListViewFirstWay() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            color: _selectedIndex == index ? _selectedColor : Colors.white,
            child: ListTile(
              title: Text("Change Color"),
              subtitle: Text("Color"),
              trailing: DropdownButton<Color>(
                  items: [
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
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedColor = value;
                      _selectedIndex = index;
                    });
                  }),
            ),
          );
        });
  }*/
}

class ColorBase {
  Color color;
  ColorBase({this.color});
}
