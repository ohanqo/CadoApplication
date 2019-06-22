import 'package:cadeaux_app/models/Cadeau.dart';
import 'package:cadeaux_app/pages/CadeauDetails.dart';
import 'package:flutter/material.dart';

class Wish extends StatelessWidget {
  final Cadeau gift;

  Wish(this.gift);

  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: new Row(
        children: <Widget>[
          Container(
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadeauDetails(this.gift)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: gift.picture != ''
                      ? Image.network(
                          gift.picture,
                        )
                      : Image(
                          image: AssetImage('assets/cadoIlustration.png'),
                        ),
                ),
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    gift.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Text(
                    "Prix: ${gift.price}€",
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
