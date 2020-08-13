import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/home_view.dart';

class TabbarView extends StatefulWidget {
  TabbarView({Key key}) : super(key: key);

  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: buildBottomNavigationBar(),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      ),
      initialIndex: 1,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        bottom: TabBar(
      tabs: <Widget>[
        // Icon(Icons.filter_1),
        // Icon(Icons.filter_2),
        // Icon(Icons.filter_3),
        // or...
        Tab(
          child: Icon(Icons.filter_1),
        ),
        Tab(
          child: Icon(Icons.filter_2),
        ),
        Tab(
          child: Icon(Icons.filter_3),
        )
      ],
      labelColor: Colors.red,
    ));
  }

  TabBarView buildBody() {
    return TabBarView(
      children: <Widget>[
        // Container(
        //   color: Colors.red,
        // ),
        // or...
        HomeView(),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }

  TabBar buildBottomNavigationBar() {
    return TabBar(
      tabs: <Widget>[
        Tab(
          child: Icon(Icons.filter_4),
        ),
        Tab(
          child: Icon(Icons.filter_5),
        ),
        Tab(
          child: Icon(Icons.filter_6),
        )
      ],
      labelColor: Colors.red,
    );
  }
}
