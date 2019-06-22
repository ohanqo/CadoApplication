import 'package:cadeaux_app/components/MenuNavbar.dart';
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

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cadeau> giftList = new List();

  @override
  void initState() {
    super.initState();
    fetchGifts();

    eventBus.on<GiftCreatedEvent>().listen((event) {
      fetchGifts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserInfo(),
            Expanded(child: UserWishList(giftList)),
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
      bottomNavigationBar: MenuNavbar(),
    );
  }

  fetchGifts() {
    GiftRepository.instance.getGifts().then((res) {
      if (res.statusCode == Constants.REQUEST_CREATED_CODE) {
        // l'api renvoie une 201 sur un get :))))))
        Map list = json.decode(res.body);
        final List<Cadeau> gifts =
            list.values.map((jsonValue) => Cadeau.fromJson(jsonValue)).toList();

        print("Maped");
        setState(() {
          giftList = gifts.reversed.toList();
        });
      }
    });
  }
}
