import 'package:flutter/material.dart';
import './Wish.dart';

class UserWishList extends StatelessWidget {
  Widget build(BuildContext context) {
    return (ListView.builder(
      itemBuilder: (_, int index) => Wish(),
      itemCount: 20,
    ));
  }
}
