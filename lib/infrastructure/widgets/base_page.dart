

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget{

  Widget child;
  NavigationBar? bottomNavigationBar;
  BasePage({super.key, required this.child, this.bottomNavigationBar});

  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}