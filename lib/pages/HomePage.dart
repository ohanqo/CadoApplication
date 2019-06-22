import 'package:cadeaux_app/components/UserWishList.dart';
import 'package:cadeaux_app/models/Cadeau.dart';
import 'package:cadeaux_app/pages/AddCadeau.dart';
import 'package:cadeaux_app/repositories/GiftRepository.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:cadeaux_app/utils/EventBus.dart';
import 'package:cadeaux_app/events/GiftCreatedEvent.dart';
import 'package:flutter/material.dart';
import 'package:cadeaux_app/components/UserInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<http.Response> myFuture;
  

  @override
  void initState() {
    super.initState();
    myFuture = GiftRepository.instance.getGifts();

    eventBus.on<GiftCreatedEvent>().listen((event) {
      myFuture = GiftRepository.instance.getGifts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserInfo(),
            Expanded(
                child: FutureBuilder(
                    future: myFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data.statusCode == Constants.REQUEST_CREATED_CODE) {
                        Map list = json.decode(snapshot.data.body);
                        final List<Cadeau> gifts = list.values.map((jsonValue) => Cadeau.fromJson(jsonValue)).toList();
                        return UserWishList(gifts.reversed.toList());
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 50.0,
          color: Colors.red,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddCadeau())),
        backgroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(color: Colors.red, width: 3.0),
        ),
      ),
    );
  }
}
