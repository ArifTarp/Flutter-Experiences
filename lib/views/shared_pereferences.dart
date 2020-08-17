import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPereferencesView extends StatefulWidget {
  SharedPereferencesView({Key key}) : super(key: key);

  @override
  _SharedPereferencesViewState createState() => _SharedPereferencesViewState();
}

class _SharedPereferencesViewState extends State<SharedPereferencesView> {

  SharedPreferences _preferences;
  String _data = "";

  @override
  void initState() { 
    super.initState();
    _getLocalData();
  }

  Future<void> _getLocalData() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.android,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(
              height: 20,
            ),
            Text(this._data),
            SizedBox(
              height: 30,
            ),
            OutlineButton(onPressed: () {
              setState(() {
                _data = _preferences.getString("key");
              });
            }, child: Text("Get Shared Data")),
            OutlineButton(onPressed: () {
              _preferences.setString("key", "arif");
            }, child: Text("Save Shared Data")),
            OutlineButton(onPressed: () {
              _preferences.remove("key");
            }, child: Text("Remove Shared Data By Key")),
            OutlineButton(onPressed: () {
              _preferences.clear();
            }, child: Text("Clear All Shared Data")),
          ],
        ),
      ),
    );
  }
}
