import 'package:cadeaux_app/pages/CadeauDetails.dart';
import 'package:cadeaux_app/pages/Groups.dart';
import 'package:cadeaux_app/pages/Register.dart';
import 'package:cadeaux_app/pages/Friends.dart';
import 'package:cadeaux_app/pages/AddFriends.dart';
import 'package:cadeaux_app/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cadeaux_app/pages/HomePage.dart';

void main() => runApp(Cado());

final ThemeData cadoTheme = ThemeData(
  bottomAppBarColor: Color.fromARGB(255, 255, 0, 85),
  primaryColor: Color.fromARGB(255, 255, 0, 85),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    shape: CircleBorder(
      side: BorderSide(color: Color.fromARGB(255, 255, 0, 85), width: 3.0),
    ),
  ),
  fontFamily: 'Segoe',
  iconTheme: IconThemeData(color: Color.fromARGB(255, 87, 219, 131)),
);

class Cado extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: "Cado",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: cadoTheme,
    );
  }
}
