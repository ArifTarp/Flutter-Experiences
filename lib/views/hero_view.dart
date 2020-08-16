import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/hero_detail_view.dart';

class HeroView extends StatefulWidget {
  HeroView({Key key}) : super(key: key);

  @override
  _HeroViewState createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HeroDetailView()));
                      },
                      child: Text("Welcome")))),
          Expanded(child: Placeholder()),
          Expanded(child: Hero(tag: "hero1", child: Icon(Icons.traffic)))
        ],
      ),
    );
  }
}
