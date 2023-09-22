import 'package:crisp/crisp_view.dart';
import 'package:crisp/models/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen>{
  late CrispMain crispMain;
  @override
  void initState() {
     crispMain = CrispMain(
      websiteId: '811bb108-fe6a-4285-9ba2-a6b8930d9f37',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(child: CrispView(
      crispMain: crispMain,
      clearCache: false,
      onLinkPressed: (url){

      },
    ));
  }
}