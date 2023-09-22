import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/data/datasources/local/shared_store.dart';

class AppVideoPlayer extends StatefulWidget {
  String link;

  AppVideoPlayer({super.key, required this.link});

  @override
  State<StatefulWidget> createState() {
    return _AppVideoPlayerState();
  }
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {

  late CachedVideoPlayerController _controller;
  late CustomVideoPlayerController _customVideoPlayerController;
  bool isInitialized = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    isInitialized = SharedStore.linkIsInitialized(widget.link);

    _controller = CachedVideoPlayerController.network(
      widget.link,
    );

    const CustomVideoPlayerSettings customVideoPlayerSettings =
    CustomVideoPlayerSettings(showSeekButtons: true);

    _customVideoPlayerController = CustomVideoPlayerController(

      context: context,
      videoPlayerController: _controller,
      customVideoPlayerSettings: customVideoPlayerSettings,
      additionalVideoSources: {
        "HD": _controller,
      },
    );

    _controller.addListener(() {
      //is called when first time initialed
      if(_controller.value.isInitialized){
        SharedStore.addLinkIsInitialized(widget.link);
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {
            isLoading = false;
          });
        });
      }
    });

    if(isInitialized){
      _controller.initialize();
    }

  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }
  // ..initialize().then((value) => setState(() {}));
  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Center(
        child: SharedStore.linkIsInitialized(widget.link)
            ? GestureDetector(
          onTap: (){
            _controller.play();
          }, child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController,),
                ),
            )
            : Container(
          color: Colors.black26,
          height: 220,
          width: ScreenUtil().screenWidth,
          child: Center(
            child: GestureDetector(
                onTap: (){
                  if(isLoading){return;}
                  setState(() {
                    isLoading = true;
                  });
                  _controller.initialize();
                  _controller.play();
                },
                child: isLoading ? CircularProgressIndicator() : Icon(Icons.play_circle, size: 50,)),
          ),
        ),
      ),
    );
  }
}
