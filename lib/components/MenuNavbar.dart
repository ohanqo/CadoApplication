import 'package:flutter/material.dart';

class MenuNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      selectedItemColor: Color.fromARGB(255, 255, 255, 255),
      unselectedItemColor: Color.fromARGB(153, 255, 255, 255),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.group), title: Text('Groupes')),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Accueil')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Amis'))
      ],
    );
  }
}
