import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final assetsImage = new AssetImage('assets/img/rick.jpg');
  Widget build(BuildContext context) {
    return (Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Colors.redAccent),
                  image: DecorationImage(fit: BoxFit.fill, image: assetsImage)),
            ),
            Text("Antoine Adam", textScaleFactor: 1.5)
          ],
        ))));
  }
}
