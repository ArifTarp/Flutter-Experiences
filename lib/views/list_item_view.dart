import "package:flutter/material.dart";
import 'package:flutter_tutorial/widgets/card_list_item_widget.dart';
import 'package:flutter_tutorial/widgets/shadow_widget.dart';

class ListItemView extends StatefulWidget {
  ListItemView({Key key}) : super(key: key);

  @override
  _ListItemView createState() => _ListItemView();
}

class _ListItemView extends State<ListItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInScaffold(),
      body: buildBodyInScaffold(),
    );
  }

  Container buildBodyInScaffold() {
    return Container(
      child: buildBodyColumnInScaffold(),
    );
  }

  Column buildBodyColumnInScaffold() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // this way is not good
        // instead of below
        // we can use custom widget(six_card_list_item_widget.dart)
        /*
        Card(
            child: ListTile(
          leading: FlutterLogo(
            size: 72.0,
          ),
          title: Text("Card 1"),
          trailing: Icon(Icons.more_vert),
          subtitle: Text("Card Content"),
        )),
        Card(
            child: ListTile(
          leading: FlutterLogo(
            size: 72.0,
          ),
          title: Text("Card 2"),
          trailing: Icon(Icons.more_vert),
          subtitle: Text("Card Content"),
        )),
        Card(
            child: ListTile(
          leading: FlutterLogo(
            size: 72.0,
          ),
          title: Text("Card 3"),
          trailing: Icon(Icons.more_vert),
          subtitle: Text("Card Content"),
        )),
        Card(
            child: ListTile(
          leading: FlutterLogo(
            size: 72.0,
          ),
          title: Text("Card 4"),
          trailing: Icon(Icons.more_vert),
          subtitle: Text("Card Content"),
        )),
        */
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardListItemWidget(
            title: "Card 1",
            icon: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => iconButtonWork(cardId: 1)),
            subtitle: Text("Card Content"),
            onPress: () {
              listTileOnPressWork(cardId: 1);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ShadowWidget(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CardListItemWidget(
              title: "Card 2",
              icon: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => iconButtonWork(cardId: 2)),
              subtitle: Text("Card Content"),
              onPress: () {
                listTileOnPressWork(cardId: 2);
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ShadowWidget(
          child: CardListItemWidget(
            title: "Card 3",
            icon: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => iconButtonWork(cardId: 3)),
            subtitle: Text("Card Content"),
            onPress: () {
              listTileOnPressWork(cardId: 3);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CardListItemWidget(
          title: "Card 4",
          icon: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => iconButtonWork(cardId: 4)),
          subtitle: Text("Card Content"),
          onPress: () {
            listTileOnPressWork(cardId: 4);
          },
        ),
      ],
    );
  }

  void listTileOnPressWork({int cardId}) {
    print("ListTile onpress worked from card $cardId");
  }

  void iconButtonWork({int cardId}) {
    print("Icon button worked from card $cardId");
  }

  AppBar buildAppBarInScaffold() {
    return AppBar();
  }
}
