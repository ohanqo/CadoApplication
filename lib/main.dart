import 'package:flutter/material.dart';
import 'package:cadeaux_app/pages/HomePage.dart';

void main() => runApp(Cado());

final ThemeData cadoTheme = ThemeData(
    bottomAppBarColor: Color.fromARGB(255, 242, 74, 85), fontFamily: 'Segoe');

class Cado extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cado",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: cadoTheme,
    );
  }
}
