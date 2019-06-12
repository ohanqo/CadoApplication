import 'package:cadeaux_app/components/MenuNavbar.dart';
import 'package:cadeaux_app/components/CadoImage.dart';
import 'package:flutter/material.dart';

class CadeauDetails extends StatelessWidget {
  const CadeauDetails(
      {Key key, this.image, this.name, this.price, this.description, this.url})
      : super(key: key);

  final String image;
  final String name;
  final String price;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    bottom: 15.0, top: 15.0, left: 25.0, right: 25.0),
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height / 3),
                child: CadoImage(),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, right: 25.0, bottom: 8.0, left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Cado 1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              color: Color.fromARGB(255, 3, 51, 51))),
                      Text("150\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.red))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 25.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.''',
                          style: TextStyle(fontSize: 15.0),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 230,
                height: 40,
                child: RaisedButton(
                    color: Colors.red,
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Consulter le cado",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15.0),
                        ),
                        Padding(
                          key: UniqueKey(),
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.receipt, color: Colors.white),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MenuNavbar(),
    );
  }
}
