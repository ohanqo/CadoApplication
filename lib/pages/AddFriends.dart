import 'package:cadeaux_app/components/MenuNavbar.dart';
import 'package:cadeaux_app/components/RoundedTextField.dart';
import 'package:cadeaux_app/components/ListItem.dart';
import 'package:flutter/material.dart';

class AddFriends extends StatelessWidget {
  const AddFriends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 40.0, right: 25.0, left: 25.0),
                  child: RoundedTextField(
                    placeholder: "Rechercher un ami",
                  )),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 15.0, bottom: 5.0),
                    child: Text("Résultat",
                        style: TextStyle(
                            fontFamily: 'Segoe',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (_, int index) => ListItem(name: "Jean Jacques",),
                itemCount: 5,
              )),
            ],
          ),
        ),
        bottomNavigationBar: MenuNavbar(),
      ),
    );
  }
}
