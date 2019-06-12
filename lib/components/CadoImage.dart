import 'package:flutter/material.dart';

class CadoImage extends StatelessWidget {
  const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              blurRadius: 5.0,
              spreadRadius: 1.5,
              offset: Offset(0.5, 2.0))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          "https://picsum.photos/250?image=9",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
