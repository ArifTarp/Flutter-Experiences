import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  FormView({Key key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // scaffold default contains scrolling property
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: buildInputDecoration(),
              controller: _textController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Can't be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: buildInputDecoration(),
              validator: (value) {
                if (value.length < 6) {
                  return "Can't be less than 6";
                } else {
                  return null;
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.reset();
                  print("okey");
                } else {
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(_textController.text),
                      duration: Duration(seconds: 3),
                      //behavior: SnackBarBehavior.fixed, THIS IS DEFAULT
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      labelText: "Form Field Text",
      hintText: "Form Field Hint",
      /*border: OutlineInputBorder(),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange))*/
      //or only
      border: OutlineInputBorder(),
    );
  }

  @override
  void dispose() {
    formKey.currentState.dispose();
    scaffoldKey.currentState.dispose();
    super.dispose();
  }
}
