import 'package:cadeaux_app/components/MenuNavbar.dart';
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
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text("Invitations", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                            ),
                            FlatButton(
                                onPressed: () {},
                                splashColor: Color.fromARGB(0, 255, 255, 255),
                                child: Text(
                                  "Tout voir(5)",
                                  style: TextStyle(color: Colors.red[500]),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 50.0,
          color: Colors.red,
        ),
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(color: Colors.red, width: 3.0),
        ),
      ),
      bottomNavigationBar: MenuNavbar(),
    );
  }
}
