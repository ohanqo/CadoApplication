import 'package:cadeaux_app/components/MenuNavbar.dart';
import 'package:cadeaux_app/components/UserWishList.dart';
import 'package:flutter/material.dart';
import 'package:cadeaux_app/components/UserInfo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserInfo(),
            Expanded(child: UserWishList()),
          ]),
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
