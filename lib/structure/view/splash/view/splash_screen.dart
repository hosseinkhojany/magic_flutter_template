

import 'package:flutter/cupertino.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    return BasePage(child: Text("Splash"));
  }
}