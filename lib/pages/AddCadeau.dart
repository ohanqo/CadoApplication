// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../components/CadoImageClickable.dart';
import 'package:cadeaux_app/components/RoundedTextField.dart';
import '../components/MenuNavbar.dart';

class AddCadeau extends StatefulWidget {
  AddCadeau({Key key}) : super(key: key);

  _AddCadeauState createState() => _AddCadeauState();
}

class _AddCadeauState extends State<AddCadeau> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController linkController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    File image;

    changeImage(img) {
      image = img;
    }

    final name = RoundedTextField(placeholder: "Nom du cadeau");

    final price = RoundedTextField(
        placeholder: "Prix", textInputType: TextInputType.number);

    final description = RoundedTextField(placeholder: "Description");

    final link = RoundedTextField(
        placeholder: "Lien vers le cadeau", textInputType: TextInputType.url);

    // uploadCadeau() {}

    final addBtn = Padding(
      padding: EdgeInsets.only(left: 0.0, right: 0.0),
      child: RaisedButton(
          textColor: Colors.white,
          color: Colors.pink,
          child: Text("Ajouter un cadeau"),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Yay! A SnackBar!'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            Scaffold.of(context).showSnackBar(snackBar);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12.0))),
    );

    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height / 3),
              child: CadoImageClickable(
                  changeImage: changeImage(image), image: image),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, right: 80.0, left: 80.0),
              child: name,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, right: 80.0, left: 80.0),
              child: price,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
              child: description,
            ),
            Container(
                margin: EdgeInsets.only(top: 30.0, right: 80.0, left: 80.0),
                child: link),
            Container(
                margin: EdgeInsets.only(top: 30.0, right: 80.0, left: 80.0),
                padding: const EdgeInsets.all(10.0),
                child: addBtn)
          ],
        ),
      )),
      bottomNavigationBar: MenuNavbar(),
    );
  }
}
