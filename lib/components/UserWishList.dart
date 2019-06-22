import 'package:cadeaux_app/models/Cadeau.dart';
import 'package:flutter/material.dart';
import './Wish.dart';

class UserWishList extends StatelessWidget {
  final List<Cadeau> giftList;

  UserWishList(this.giftList);

  Widget build(BuildContext context) {
    return (ListView.builder(
      itemBuilder: (BuildContext ctxt, int index) {
        return new Wish(giftList[index]);
      },
      itemCount: giftList.length,
    ));
  }
}
