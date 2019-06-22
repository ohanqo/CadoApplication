// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:cadeaux_app/dtos/AddCadeauDto.dart';
import 'package:cadeaux_app/events/GiftCreatedEvent.dart';
import 'package:cadeaux_app/repositories/GiftRepository.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:cadeaux_app/utils/EventBus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../components/CadoImageClickable.dart';
import 'package:cadeaux_app/components/RoundedTextField.dart';

class AddCadeau extends StatefulWidget {
  AddCadeau({Key key}) : super(key: key);

  _AddCadeauState createState() => _AddCadeauState();
}

class _AddCadeauState extends State<AddCadeau> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController linkController = new TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool isFormAutoValidatingFields = false;
  File image;

  @override
  Widget build(BuildContext context) {
    changeImage(img) {
      image = img;
    }

    Function(String) validateNotEmpty = (String value) {
      if (value.trim().length == 0) {
        return "Ce champ est requis.";
      }
    };

    Function(String) validateURL = (String value) {
      String patternUrl =
          r'((http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?)';
      RegExp regExp = new RegExp(patternUrl);
      if (value.trim().length == 0) {
        return "Ce champ est requis.";
      } else if (!regExp.hasMatch(value)) {
        return "Ce champ ne correspond pas à une URL";
      }
    };

    final name = RoundedTextField(
      placeholder: "Nom du cadeau",
      textEditingController: nameController,
      validator: validateNotEmpty,
    );

    final price = RoundedTextField(
      placeholder: "Prix",
      textInputType: TextInputType.number,
      textEditingController: priceController,
      validator: validateNotEmpty,
    );

    final description = RoundedTextField(
      placeholder: "Description",
      validator: validateNotEmpty,
      textEditingController: descController,
      maxLines: 2,
    );

    final link = RoundedTextField(
      placeholder: "Lien vers le cadeau",
      textInputType: TextInputType.url,
      textEditingController: linkController,
      validator: validateURL,
    );

    final addBtn = Padding(
      padding: EdgeInsets.only(left: 0.0, right: 0.0),
      child: RaisedButton(
          textColor: Colors.white,
          color: Colors.pink,
          child: Text("Ajouter un cadeau"),
          onPressed: () {
            handleAddGiftClick();
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12.0))),
    );

    return Scaffold(
      key: scaffoldKey,
      body: Container(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidate: isFormAutoValidatingFields,
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
                margin: EdgeInsets.only(top: 30.0, right: 80.0, left: 80.0),
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
        ),
      )),
    );
  }

  void handleAddGiftClick() {
    if (formKey.currentState.validate()) {
      sendAddGiftRequest();
    } else {
      setState(() {
        isFormAutoValidatingFields = true;
      });
    }
  }

  void sendAddGiftRequest() async {
    AddCadeauDto cadeauDto = new AddCadeauDto(
        desc: descController.text,
        link: linkController.text,
        name: nameController.text,
        price: int.parse(priceController.text));

    final res = await GiftRepository.instance.addGiftToCurrentUser(cadeauDto);

    if (res.statusCode == Constants.REQUEST_CREATED_CODE) {
      Navigator.pop(context);
      eventBus.fire(GiftCreatedEvent());
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Désolé, un problème a été rencontré.'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}
