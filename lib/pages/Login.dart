import 'package:cadeaux_app/components/RoundedTextField.dart';
import 'package:cadeaux_app/dto/LoginUserDto.dart';
import 'package:cadeaux_app/repositories/UserRepository.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'Register.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State <LoginPage> {
  int loadingState = 0;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isFormAutoValidatingFields = false;
  bool isKeyboardVisible = false;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();


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

  Widget build(BuildContext context){

    final logo = Hero(
      tag:'hero',
      child:CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 78.0,
        child: Image.asset('assets/logo.png'),
      ),
    );


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

    var background = isKeyboardVisible
        ? Container(height: 0)
        : Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.fill)),
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
          return Text('Connexion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ));
      }
    }


    final loginButton = Padding(

      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
     // padding: EdgeInsets.only(left: 94.0, right:94.0),

     // padding: EdgeInsets.symmetric(vertical: 36.0),
      child:Material(
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        color: Colors.pink,
        //elevation: 5.0,
        child: MaterialButton(
          //color: Colors.green,
          minWidth: 200.0,
          height: 42.0,
          onPressed: ()=> handleLoginClick(),
          child: loginButtonContent(),
        ),

        ),
    );




    _forgotLabel() {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
              ),
            ),
           // SizedBox(width: 15.0),
            Expanded(
                child: Container(
                  child: FlatButton(
                    child: Text(
                      'Mot de passe oublié?',
                      style:TextStyle(color: Colors.pink ,fontSize: 13.0),
                    ),
                    onPressed:() {},
                    ),
                ))
          ],
        ),
      );
    }



    _signUp() {
      return Padding(
        padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                  child: Text(
                    'Nouvel utilisateur?',
                    style:TextStyle(color: Colors.black54 ,fontSize: 13.0),
                    textAlign: TextAlign.end
                  ),
              ),
            ),
            Expanded(
                child: Container(
                  child: FlatButton(
                    child: Text(
                      'S\'enregistrer',
                      textAlign: TextAlign.start,
                      style:TextStyle(color: Colors.pink ,fontSize: 13.0),
                    ),
                    onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
                ))
          ],
        ),
      );
    }



    return Scaffold(
      key: scaffoldKey,
      body:Stack(
          fit:StackFit.expand,
          children: <Widget>[
            background,
            Column(
              children: <Widget>[
                Expanded(
                  child: Form(
                  key: formKey,
                  autovalidate: isFormAutoValidatingFields,
                  child: ListView(
                      shrinkWrap:true,
                   // padding: EdgeInsets.symmetric(vertical: 160.0),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 50.0),
                          child: logo,
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
                        _signUp()
                      ],
                      ),

                  ),
                ),
              ],
            )
          ],

    ),
    );
  }

  void handleLoginClick() {
    if (formKey.currentState.validate()) {
      sendLoginRequest();
    } else {
      setState(() {
        isFormAutoValidatingFields = true;
      });
    }
  }

  void sendLoginRequest() async {
    if (loadingState == 1) {
      return;
    }

    setState(() {
      loadingState = 1;
    });

    LoginUserDto createUserDto = new LoginUserDto(
        username: emailController.text,
        password: passwordController.text);

    final res = await UserRepository.instance.login(createUserDto);

    handleRegisterResponse(res);
  }

  void handleRegisterResponse(http.Response res) {
    switch (res.statusCode) {
      case Constants.REQUEST_LOGIN_OK_CODE:
        setState(() {
          loadingState = 2;
        });

        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Connexion réussi.'),
          backgroundColor: Colors.lightGreen,
        ));
        break;
      case Constants.REQUEST_NOT_FOUND_CODE:
        setState(() {
          loadingState = 3;
        });

        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Désolé, identifiants incorrects.'),
          backgroundColor: Colors.deepOrange,
        ));
        break;
      case Constants.REQUEST_UNAUTHORIZED_CODE:
        setState(() {
          loadingState = 3;
        });

        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Désolé, identifiants incorrects.'),
          backgroundColor: Colors.deepOrange,
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




