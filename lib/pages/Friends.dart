import 'package:cadeaux_app/components/InvitationItem.dart';
import 'package:cadeaux_app/components/ListItem.dart';
import 'package:cadeaux_app/pages/AddFriends.dart';
import 'package:flutter/material.dart';

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5.0,
                          spreadRadius: 1.5,
                          offset: Offset(0.5, 2.0))
                    ],
                  ),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 4),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Invitations",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            FlatButton(
                                onPressed: () => {},
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Text(
                                  "Tout voir(5)",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ))
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: InvitationItem()),
                      Expanded(
                        flex: 1,
                        child: InvitationItem(),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                    child: Text(
                      "Liste d'amis",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (_, int index) => ListItem(
                      name: "Jean Dupont",
                      type: 'delete',
                    ),
                itemCount: 20,
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 50.0,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddFriends(),
              ),
            ),
      ),
    );
  }
}
