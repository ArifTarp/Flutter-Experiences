import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  DetailView({Key key}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context).settings.arguments),
        automaticallyImplyLeading: false,
        actions: [Chip(label: Text("Back"), onDeleted: () {
          Navigator.pop(context);
          print(Navigator.canPop(context)); // return false
          // because I use "Navigator.pushNamedAndRemoveUntil(context, "/detailView", (route) => false);" in CardInformationsView
        })],
      ),
    );
  }
}
