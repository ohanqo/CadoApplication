import 'package:flutter/material.dart';
class InvitationItem extends StatelessWidget {
  const InvitationItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("https://picsum.photos/250?image=9"),
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:
                        Text("Jean Dupont", style: TextStyle(fontSize: 17.0)),
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
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.do_not_disturb_alt,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check_circle_outline,
                            size: 30.0,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
