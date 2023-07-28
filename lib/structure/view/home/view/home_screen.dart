

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{

  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BasePage(child: Text("Splash"),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Learn',
            tooltip: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.engineering),
            icon: Icon(Icons.engineering_outlined),
            label: 'Relearn',
            tooltip: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Unlearn',
            tooltip: "",
          ),
        ],
      ),);
  }
}