import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class HtmlParseView extends StatefulWidget {
  HtmlParseView({Key key}) : super(key: key);

  @override
  _HtmlParseViewState createState() => _HtmlParseViewState();
}

class _HtmlParseViewState extends State<HtmlParseView> {
  String _url;
  Future _future;
  @override
  void initState() {
    super.initState();
    _url = "https://my-custom-api-b0af8.firebaseio.com/html_tags.json";
    // so define; prevent again request
    // otherwise if we use setState(or state managers) anywhere in this view or navigate between views; again send request
    _future = _getHtmlTemplateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Html(
                data: snapshot.data,
                style: {
                  "h1": Style(color: Colors.blue),
                  "h2": Style(color: Colors.red)
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text("err");
            }
          },
        ),
      ),
    );
  }

  Future _getHtmlTemplateData() async {
    var response = (await http.get(_url)).body;
    var data = json.decode(response);
    // TODO Enhancement...
    return data["-ME5_aNtphcYjB0rXmco"]["html_tag"];
  }
}
