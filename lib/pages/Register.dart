import 'dart:async';
import 'package:cadeaux_app/components/RoundedTextField.dart';
import 'package:cadeaux_app/dto/CreateUserDto.dart';
import 'package:cadeaux_app/pages/Login.dart';
import 'package:cadeaux_app/repositories/UserRepository.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  RegisterState createState() => new RegisterState();
}

class RegisterState extends State<Register> {
  int loadingState = 0;
  bool isKeyboardVisible = false;
  bool isFormAutoValidatingFields = false;
  GlobalKey<FormState> formKey = new GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @protected
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          isKeyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Function(String) validateName = (String value) {
      String patttern = r'(^[a-zA-Z ]*$)';
      RegExp regExp = new RegExp(patttern);
      if (value.trim().length == 0) {
        return "Ce champ est requis.";
      } else if (!regExp.hasMatch(value)) {
        return "Ce champ n'est pas correct.";
      }
      return null;
    };

    Function(String) validateEmail = (String value) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if (value.trim().length == 0) {
        return "Une adresse email est requise.";
      } else if (!regExp.hasMatch(value)) {
        return "L'adresse email n'est pas valide.";
      } else {
        return null;
      }
    };

    Function(String) validatePassword = (String value) {
      if (value.trim().length == 0) {
        return "Un mot de passe est requis.";
      } else if (value.trim().length < 8) {
        return "Minimum de 8 caractères.";
      } else {
        return null;
      }
    };

    final logo = Image(
      image: AssetImage('assets/logo.png'),
      height: 200.0,
    );

    var background = isKeyboardVisible
        ? Container(height: 0)
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill)),
          );

    final lastName = RoundedTextField(
      placeholder: "Nom",
      validator: validateName,
      textEditingController: lastNameController,
    );

    final firstName = RoundedTextField(
      placeholder: "Prénom",
      validator: validateName,
      textEditingController: firstNameController,
    );

    final email = RoundedTextField(
      placeholder: "Email",
      textInputType: TextInputType.emailAddress,
      validator: validateEmail,
      textEditingController: emailController,
    );

    final password = RoundedTextField(
      placeholder: "Mot de passe",
      isTextObscur: true,
      validator: validatePassword,
      textEditingController: passwordController,
    );

    final loginNavigation = InkWell(
      onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))},
      child: Text(
        'Connexion',
        style: TextStyle(color: Colors.pink),
      ),
    );

    Widget loginButtonContent() {
      switch (loadingState) {
        case 1:
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
          break;
        case 2:
          return Icon(Icons.check, color: Colors.white);
          break;
        case 3:
          return Icon(Icons.close, color: Colors.white);
          break;
        default:
          return Text('S\'enregistrer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ));
      }
    }

    final loginButton = Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.black,
        color: Colors.pink,
        elevation: 3.0,
        child: MaterialButton(
            minWidth: 300.0,
            height: 42.0,
            onPressed: () => handleRegisterClick(),
            child: loginButtonContent()),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          background,
          SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidate: isFormAutoValidatingFields,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: logo,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0, right: 80.0, left: 80.0),
                    child: firstName,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, right: 80.0, left: 80.0),
                    child: lastName,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, right: 80.0, left: 80.0),
                    child: email,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, right: 80.0, left: 80.0),
                    child: password,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, right: 65.0, left: 65.0),
                    padding: EdgeInsets.all(10.0),
                    child: loginButton,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 5.0, right: 65.0, left: 65.0, bottom: 50.0),
                    child: loginNavigation,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleRegisterClick() {
    if (formKey.currentState.validate()) {
      sendRegisterRequest();
    } else {
      setState(() {
        isFormAutoValidatingFields = true;
      });
    }
  }

  void sendRegisterRequest() async {
    if (loadingState == 1) {
      return;
    }

    setState(() {
      loadingState = 1;
    });

    CreateUserDto createUserDto = new CreateUserDto(
        username: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        password: passwordController.text);

    final res = await UserRepository.instance.register(createUserDto);

    handleRegisterResponse(res);
  }

  void handleRegisterResponse(http.Response res) {
    switch (res.statusCode) {
      case Constants.REQUEST_USERNAME_ALREADY_EXIST_CODE:
        setState(() {
          loadingState = 3;
        });

        emailController.text = '';
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Désolé, l\'adresse email est déjà prise…'),
          backgroundColor: Colors.deepOrangeAccent,
        ));
        break;
      case Constants.REQUEST_CREATED_CODE:
        setState(() {
          loadingState = 2;
        });

        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Création réussi.'),
          backgroundColor: Colors.lightGreen,
        ));
        break;
      default:
        setState(() {
          loadingState = 3;
        });

        scaffoldKey.currentState.showSnackBar(SnackBar(
          content:
              Text('Désolé, une erreur est survenue. Réessayer ultérieurement'),
          backgroundColor: Colors.redAccent,
        ));
    }

    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        loadingState = 0;
      });
    });
  }
}
