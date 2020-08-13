import "package:flutter/material.dart";

class UIBaseView extends StatefulWidget {
  UIBaseView({Key key}) : super(key: key);

  @override
  _UIBaseViewState createState() => _UIBaseViewState();
}

class _UIBaseViewState extends State<UIBaseView> {
  @override
  Widget build(BuildContext context) {
    // if you dont use their, flutter does not know it
    // return error because required theme, scaffold or material etc.
    // in this way, we told to it the theme
    // return Container(
    //   child: Center(child: Text("a")),
    // );

    // we can do it like;
    //return buildMaterial();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      appBar: buildAppBarInScaffold(),
      body: buildBodyInScaffold(),
      floatingActionButton: buildFloatingActionButtonInScaffold(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomAppBarInScaffold(),
    );
  }

  Container buildBodyInScaffold() {
    return Container(
      //color: Colors.red,
      /*
      height: 100,
      width: 100,
      */
      decoration: buildBodyBoxDecorationInScaffold(),
      child: buildBodyColumnInScaffold(),
      //child: buildBodyRowInScaffold(),
    );
  }

  BoxDecoration buildBodyBoxDecorationInScaffold() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.black, width: 8.0));
  }

  Column buildBodyColumnInScaffold() {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      //mainAxisSize: MainAxisSize.max,

      // we can use in Row
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(),
        TextField(),
        TextField(),
        TextField(),
        RaisedButton(onPressed: () {})
      ],
    );
  }

  Row buildBodyRowInScaffold() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(onPressed: () {}),
        RaisedButton(onPressed: () {}),
        //Expanded(child: RaisedButton(onPressed: () {}))
        // or
        Flexible(
            //fit: FlexFit.tight,
            fit: FlexFit.loose,
            child: RaisedButton(onPressed: () {}))
      ],
    );
  }

  FloatingActionButton buildFloatingActionButtonInScaffold(
      BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                height: 300,
              );
            });
      },
    );
  }

  BottomAppBar buildBottomAppBarInScaffold() {
    return BottomAppBar(
      color: Colors.white,
      child: Text("Bottom"),
    );
  }

  AppBar buildAppBarInScaffold() {
    return AppBar(
      title: Center(
        child: Text("My Custom App Bar"),
      ),
      leading: Icon(Icons.menu),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
        IconButton(icon: Icon(Icons.account_box), onPressed: () {}),
      ],
    );
  }

  Material buildMaterial() {
    return Material(
      child: Container(
        child: Center(child: Text("a")),
      ),
    );
  }
}
