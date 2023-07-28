

import 'package:flutter/cupertino.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return BasePage(child: Text("Splash"));
  }
}