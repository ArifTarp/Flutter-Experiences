import 'package:flutter/material.dart';

class PageViewView extends StatefulWidget {
  PageViewView({Key key}) : super(key: key);

  @override
  _PageViewViewState createState() => _PageViewViewState();
}

class _PageViewViewState extends State<PageViewView> {
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _buildExpanded(),
        Expanded(
          child: _buildPageView(),
        ),
        _buildExpanded(),
      ],
    ));
  }

  Expanded _buildExpanded() {
    return Expanded(
        child: Container(
      color: Colors.blue,
      child: Center(
          child: _currentPage == 3
              ? Text("Page is 3")
              : Text("Page is another page")),
    ));
  }

  Padding _buildPageView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PageView.builder(
        onPageChanged: _buildOnPageChanged,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            child: Center(
              child: Text(
                "$index",
                style: TextStyle(color: Colors.red, fontSize: 50),
              ),
            ),
            color: Colors.black,
          );
        },
      ),
    );
  }

  void _buildOnPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
