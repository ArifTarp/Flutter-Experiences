import 'package:flutter/material.dart';

class PopupAndWrapAndChipView extends StatefulWidget {
  PopupAndWrapAndChipView({Key key}) : super(key: key);

  @override
  _PopupAndWrapAndChipViewState createState() =>
      _PopupAndWrapAndChipViewState();
}

class _PopupAndWrapAndChipViewState extends State<PopupAndWrapAndChipView> {
  bool _inputChipIsSeletected;
  bool _choiceChipIsSeletected;

  @override
  void initState() {
    super.initState();
    _inputChipIsSeletected = false;
    _choiceChipIsSeletected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWithPopup(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildWrapInsteadOfRow(),
          Chip(label: Text("Basic Chip")),
          Chip(
            label: Text("Delete"),
            deleteIcon: Icon(Icons.delete_forever),
            onDeleted: () {},
          ),
          Chip(
            label: Text("Avatar Chip"),
            avatar: CircleAvatar(
              child: Text("A"),
            ),
          ),
          InputChip(
            label: Text("Input Chip"),
            selected: _inputChipIsSeletected,
            checkmarkColor: Colors.red,
            onPressed: () {
              setState(() {
                _inputChipIsSeletected = !_inputChipIsSeletected;
              });
            },
          ),
          ChoiceChip(
            label: Text("Choice Chip"),
            selected: _choiceChipIsSeletected,
            onSelected: (value) {
              setState(() {
                _choiceChipIsSeletected = value;
              });
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBarWithPopup() {
    return AppBar(
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            print(value);
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("tr"),
              value: "tr",
            ),
            PopupMenuItem(
              child: Text("ru"),
              value: "ru",
            ),
            PopupMenuItem(
              child: Text("en"),
              value: "en",
            ),
          ],
        )
      ],
    );
  }

  Container _buildWrapInsteadOfRow() {
    return Container(
      height: 200,
      color: Colors.blueAccent,
      /*child: Row(
            children: [Text("text" * 25)],
          ),*/
      // line width is not enough so other way;
      child: Wrap(
        children: [Text("text" * 50)],
      ),
    );
  }
}
