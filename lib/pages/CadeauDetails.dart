import 'package:cadeaux_app/components/CadoImage.dart';
import 'package:cadeaux_app/models/Cadeau.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CadeauDetails extends StatelessWidget {
  final Cadeau cadeau;

  CadeauDetails(this.cadeau);

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
                child: Hero(
                  tag: cadeau.id,
                  child: cadeau.picture != ''
                      ? CadoImage(cadeau.picture)
                      : Image(
                          image: AssetImage('assets/cadoIlustration.png'),
                        ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, right: 25.0, bottom: 8.0, left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(cadeau.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              color: Color.fromARGB(255, 3, 51, 51))),
                      Text("${cadeau.price}€",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColor))
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
                          cadeau.description ?? 'Aucune description',
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
                    color: Theme.of(context).primaryColor,
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                            child: Text(
                              "Consulter le cado",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                            onTap: () => launch(cadeau.link)),
                        Padding(
                          key: UniqueKey(),
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.receipt, color: Colors.white),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
