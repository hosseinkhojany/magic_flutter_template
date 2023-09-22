

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget{

  Widget child;
  NavigationBar? bottomNavigationBar;
  AppBar? appBar;
  BasePage({super.key, required this.child, this.bottomNavigationBar, this.appBar});

  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage>{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: widget.appBar,
        backgroundColor: Colors.white,
        body: widget.child,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}