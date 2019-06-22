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
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  bool isLoading = false;
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

    Widget buttonContent() {
      if (isLoading) {
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
      } else {
        return Text('Ajouter un cadeau',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ));
      }
    }

    final addBtn = Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.black,
        color: Colors.pink,
        elevation: 3.0,
        child: MaterialButton(
            minWidth: 300.0,
            height: 42.0,
            onPressed: () => handleAddGiftClick(),
            child: buttonContent()),
      ),
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
                child:
                    CadoImageClickable(changeImage: changeImage, image: image),
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
    if (isLoading) return;

    if (formKey.currentState.validate()) {
      sendAddGiftRequest();
    } else {
      setState(() {
        isFormAutoValidatingFields = true;
      });
    }
  }

  Future<String> uploadPhotoToFirebase() async {
    String photoURL = '';
    if (image != null) {
      await FirebaseAuth.instance.signInAnonymously();
      int lastSlashIndexOfPhotoPath = image.path.lastIndexOf('/');
      String imageName = image.path.substring(lastSlashIndexOfPhotoPath + 1);
      final StorageReference storageRef =
          FirebaseStorage.instance.ref().child("photos/$imageName");
      final uploadTask = storageRef.putFile(image);
      final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      photoURL = (await downloadUrl.ref.getDownloadURL());
      print('URL Is $photoURL');
      FirebaseAuth.instance.signOut();
    }

    return photoURL;
  }

  void sendAddGiftRequest() async {
    setState(() {
      isLoading = true;
    });

    String photoURL = await uploadPhotoToFirebase();

    AddCadeauDto cadeauDto = new AddCadeauDto(
      desc: descController.text,
      link: linkController.text,
      name: nameController.text,
      price: int.parse(priceController.text),
      picture: photoURL,
    );

    final res = await GiftRepository.instance.addGiftToCurrentUser(cadeauDto);

    setState(() {
      isLoading = false;
    });

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
