import 'package:flutter/material.dart';

class ExpansionTileAndListViewView extends StatefulWidget {
  ExpansionTileAndListViewView({Key key}) : super(key: key);

  @override
  _ExpansionTileAndListViewViewState createState() =>
      _ExpansionTileAndListViewViewState();
}

class _ExpansionTileAndListViewViewState
    extends State<ExpansionTileAndListViewView> {
  List<Text> datas;

  @override
  void initState() {
    super.initState();
    datas = new List<Text>();
    for (var i = 0; i < 10; i++) {
      datas.add(Text("$i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        /*child: ListView(children: <Widget>[
          _buildCard()
        ]),*/
        // or another way
        child: SingleChildScrollView(child: _buildCard()),
      ),
    );
  }

  Card _buildCard() {
    return Card(
      color: Colors.grey,
      child: ExpansionTile(
        title: Text(
          "Counter",
          style: TextStyle(color: Colors.white),
        ),
        children: <Widget>[
          //...datas
          //or
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Center(
                  child: datas[index],
                ),
              );
            },
          )
        ],
        backgroundColor: Colors.orange,
      ),
    );
  }
}
