import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/detail.dart';
import 'package:flutter_tutorial/models/information.dart';
import 'package:http/http.dart' as http;

class HttpPostAndShowDialogView extends StatefulWidget {
  HttpPostAndShowDialogView({Key key}) : super(key: key);

  @override
  _HttpPostAndShowDialogViewState createState() =>
      _HttpPostAndShowDialogViewState();
}

class _HttpPostAndShowDialogViewState extends State<HttpPostAndShowDialogView> {
  TextEditingController _firstNameTextController;
  TextEditingController _lastNameTextController;
  TextEditingController _imageUrlTextController;
  TextEditingController _cityTextController;
  TextEditingController _jobTextController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _imageUrlTextController = TextEditingController();
    _cityTextController = TextEditingController();
    _jobTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    /* var _floatingActionButton = {
      "floatingActionButton": FloatingActionButton(
        onPressed: () {
          _buildShowDialog(context);
        },
        child: Icon(Icons.add),
      ),
      "floatingActionButtonLocation": FloatingActionButtonLocation.endFloat
    };*/
    // or we can use with function for example _getFloatingActionButtonProperties

    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton:
          _getFloatingActionButtonProperties(context)["floatingActionButton"],
      floatingActionButtonLocation: _getFloatingActionButtonProperties(
          context)["floatingActionButtonLocation"],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Http post and alert dialog"),
    );
  }

  Map<String, Object> _getFloatingActionButtonProperties(BuildContext context) {
    var _floatingActionButton = {
      "floatingActionButton": FloatingActionButton(
        onPressed: () {
          _buildShowDialog(context);
        },
        child: Icon(Icons.add),
      ),
      "floatingActionButtonLocation": FloatingActionButtonLocation.endFloat
    };
    return _floatingActionButton;
  }

  void _buildShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Card(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildTextField(
                        textController: _firstNameTextController,
                        labelText: "First Name"),
                    _buildTextField(
                        textController: _lastNameTextController,
                        labelText: "Last Name"),
                    _buildTextField(
                        textController: _imageUrlTextController,
                        labelText: "Image Url"),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "DETAILS",
                            style:
                                TextStyle(fontSize: 20, fontFamily: "Roboto"),
                          ),
                          _buildTextField(
                              textController: _cityTextController,
                              labelText: "City"),
                          _buildTextField(
                              textController: _jobTextController,
                              labelText: "Job"),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _postInformationsData().then((value) =>
                              {_formKey.currentState.reset(), print(value)});
                        } else {
                          print("invalid form");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ));
        });
  }

  TextFormField _buildTextField(
      {TextEditingController textController, String labelText}) {
    return TextFormField(
        controller: textController,
        decoration: InputDecoration(labelText: labelText),
        validator: (value) {
          if (value.isEmpty) {
            return "$labelText can't be empty";
          } else {
            return null;
          }
        });
  }

  Future _postInformationsData() async {
    var model = Information(
        _firstNameTextController.text,
        _lastNameTextController.text,
        _imageUrlTextController.text,
        Detail(_cityTextController.text, _jobTextController.text));

    // var jsonStringData = json.encode(model);
    // or...
    var jsonStringData = json.encode(model.toJson());
    print(jsonStringData);
    // jsonStringData must be String

    var response = await http.post(
        "https://my-custom-api-4f6e8.firebaseio.com/informations.json",
        body: jsonStringData);

    return response.statusCode == 200 ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _imageUrlTextController.dispose();
    _cityTextController.dispose();
    _jobTextController.dispose();
    _formKey.currentState.dispose();
  }
}
