import 'package:cadeaux_app/pages/Login.dart';
import 'package:cadeaux_app/pages/NavigationWrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    checkIfUserHasToken();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image(
      image: AssetImage('assets/logo.png'),
      height: 200.0,
    );

    var background = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/background.png"), fit: BoxFit.fill),
      ),
    );

    var loadingScreen = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        background,
        Container(
          alignment: Alignment.center,
          child: logo,
        )
      ],
    );

    return Scaffold(
      body: isLoggedIn == null
          ? loadingScreen
          : Scaffold(
              body: isLoggedIn ? NavigationWrapper() : LoginPage(),
            ),
    );
  }

  bool isValidToken(String token) {
    return token != null && token.toString().trim() != '';
  }

  checkIfUserHasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');

    setState(() {
      isLoggedIn = isValidToken(token);
    });
  }
}
