import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({Key key, this.name, this.type}) : super(key: key);
  final String type;
  final String name;

  @override
  Widget build(BuildContext context) {
    Icon icon =
        (type == 'delete') ? Icon(
                              Icons.delete_outline,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ) : Icon(
                              Icons.check_circle_outline,
                              size: 30.0,
                            );
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://picsum.photos/250?image=9"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child:
                          Text("$name", style: TextStyle(fontSize: 17.0)),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: icon),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
