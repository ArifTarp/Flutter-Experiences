import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

// AutomaticKeepAliveClientMixin; prevents reloading of view
// for example tabbar_view.dart
class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  String _data = "Welcome";
  bool _dataBool = false;
  bool _isDark;

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _isDark = false;
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      color: _isDark ? Colors.red : Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text(_data),
          Text(
            _dataBool.toString(),
            style: TextStyle(color: Colors.white),
          ),
          Center(
            child: RaisedButton(
              child: Icon(Icons.account_balance_wallet),
              onPressed: () {
                // _data = "New Welcome";
                // this instead we can use;
                setState(() {
                  // _data = "New Welcome";
                  // or cute another sample
                  _dataBool = !_dataBool;
                  _isDark = !_isDark;
                });
                //print(_data);
              },
            ),
          ),
          Visibility(
              visible: _dataBool,
              child: Text(
                "$_data",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
