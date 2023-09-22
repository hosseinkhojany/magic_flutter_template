

import 'package:flutter/material.dart';
import 'package:rapexa_academy/infrastructure/constants/app_colors.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/view/chat/view/chat_screen.dart';
import 'package:rapexa_academy/structure/view/home/view/home_screen.dart';
import 'package:rapexa_academy/structure/view/posts/post_screen.dart';
import 'package:rapexa_academy/structure/view/profile/view/profile_screen.dart';

class NavigationScreen extends StatefulWidget{
  const NavigationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavigationScreenState();
  }
}

class _NavigationScreenState extends State<NavigationScreen>{

  int selectedPageIndex = 0;

  final List _pages = const [
    HomeScreen(),
    PostScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(bottomNavigationBar: NavigationBar(
      indicatorColor: AppColors.appColor,
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'خانه',
            tooltip: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'مقالات',
            tooltip: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'پشتیبانی',
            tooltip: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'پروفایل',
            tooltip: '',
          ),
        ],
      ),
      child: _pages[selectedPageIndex]);
  }
}
