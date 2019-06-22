import 'package:cadeaux_app/components/MenuNavbar.dart';
import 'package:cadeaux_app/pages/Friends.dart';
import 'package:cadeaux_app/pages/Groups.dart';
import 'package:cadeaux_app/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationWrapper extends StatefulWidget {
  NavigationWrapper({Key key}) : super(key: key);

  _NavigationWrapperState createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _selectedTab = 1;
  final _pageOptions = [
    Groups(),
    HomePage(),
    Friends(),
  ];

  onItemSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: MenuNavbar(
        currentItemSelected: _selectedTab,
        selectedItemCallback: onItemSelected,
      ),
    );
  }
}
