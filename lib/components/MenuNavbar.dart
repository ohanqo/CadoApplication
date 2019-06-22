import 'package:cadeaux_app/pages/Friends.dart';
import 'package:cadeaux_app/pages/Groups.dart';
import 'package:cadeaux_app/pages/HomePage.dart';
import 'package:flutter/material.dart';

class MenuNavbar extends StatefulWidget {
  final int currentItemSelected;
  final void Function(int) selectedItemCallback;

  MenuNavbar({Key key, this.currentItemSelected, this.selectedItemCallback})
      : super(key: key);

  _MenuNavBarState createState() => _MenuNavBarState();
}

class _MenuNavBarState extends State<MenuNavbar> {
  _MenuNavBarState() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: this.widget.currentItemSelected,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        onTap: (index) => widget.selectedItemCallback(index),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(153, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.group), title: Text('Groupes')),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Accueil')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Amis'))
        ],
      ),
    );
  }
}

// class MenuNavbar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: 2,
//       backgroundColor: Theme.of(context).bottomAppBarColor,
//       selectedItemColor: Color.fromARGB(255, 255, 255, 255),
//       unselectedItemColor: Color.fromARGB(153, 255, 255, 255),
//       onTap: (index) => {print(index)},
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//             icon: Icon(Icons.group), title: Text('Groupes')),
//         BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Accueil')),
//         BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Amis'))
//       ],
//     );
//   }
// }
