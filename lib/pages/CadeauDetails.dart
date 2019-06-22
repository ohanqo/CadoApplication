import 'package:cadeaux_app/components/MenuNavbar.dart';
import 'package:cadeaux_app/components/CadoImage.dart';
import 'package:cadeaux_app/models/Cadeau.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<Cadeau> fetchCadeauDetails() async {
  final response = await http.get(
      'https://501fc44b-31c7-4dbc-8f43-b88eb571eed0.mock.pstmn.io/gift/1/1/');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Cadeau.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class CadeauDetails extends StatelessWidget {
  CadeauDetails(
      {Key key, this.image, this.name, this.price, this.description, this.url})
      : super(key: key);

  final String image;
  final String name;
  final String price;
  final String description;
  final String url;
  final Future<Cadeau> cadeau = fetchCadeauDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Cadeau>(
            future: cadeau,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
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
                              Text(snapshot.data.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23.0,
                                      color: Color.fromARGB(255, 3, 51, 51))),
                              Text(snapshot.data.price.toString(),
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
                        padding:
                            EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                child: Text(
                                  snapshot.data.description,
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
                                    onTap: () => launch(snapshot.data.url)),
                                Padding(
                                  key: UniqueKey(),
                                  padding: EdgeInsets.only(left: 8.0),
                                  child:
                                      Icon(Icons.receipt, color: Colors.white),
                                )
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
      bottomNavigationBar: MenuNavbar(),
    );
  }
}
