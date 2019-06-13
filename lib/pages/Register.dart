import 'package:cadeaux_app/components/RoundedTextField.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => new RegisterState();
}

class RegisterState extends State<Register> {
  bool isKeyboardVisible = false;

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

    final lastName = RoundedTextField(placeholder: "Nom");

    final firstName = RoundedTextField(placeholder: "Prénom");

    final email = RoundedTextField(
      placeholder: "Email",
      textInputType: TextInputType.emailAddress,
    );

    final password = RoundedTextField(placeholder: "Mot de passe");

    final loginNavigation = GestureDetector(
      onTap: () => print("Bouton connexion cliqué"),
      child: Text(
        'Connexion',
        style: TextStyle(color: Colors.pink),
      ),
    );

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
          onPressed: () {},
          child: Text('S\'enregistrer',
              style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          background,
          SingleChildScrollView(
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
        ],
      ),
    );
  }
}
