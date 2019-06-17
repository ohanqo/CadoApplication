import 'package:flutter/material.dart';

class Wish extends StatelessWidget {
  final imgSection = Container(
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          "https://picsum.photos/250?image=9",
        ),
      ));

  final detailsSection = Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
          // SizedBox(height: 20),
          Text(
            "Prix : 1000€",
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ],
      ),
    ),
  );

  final iconSection = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Colors.red,
            size: 30.0,
          ),
          onPressed: () {
            print("delete");
          },
        )
      ],
    ),
  );

  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: new Row(
        children: <Widget>[imgSection, detailsSection, iconSection],
      ),
    );
  }
}
