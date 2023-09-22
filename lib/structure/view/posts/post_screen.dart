import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/routes.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/data/models/response/get_posts_rp.dart';
import 'package:rapexa_academy/structure/presenter/post_controller.dart';
import '../../data/models/response/get_products_rp.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostScreenState();
  }
}

class PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<PostController>(
        autoRemove: false,
        builder: (controller) {
          return controller.rp == null ? Container() : BasePage(
              child: SizedBox(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: AnimationLimiter(
                        child: GridView.builder(
                          itemCount: controller.rp!.list!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: PostItem(
                                    post: controller.rp!.list![index],
                                  ),
                                ),
                              ),
                            );
                          },
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
        },
      );
  }
}

class PostItem extends StatelessWidget {
  late Post post;

  PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.r),
      child: GestureDetector(
        onTap: (){
          Get.find<PostController>().gotoDetailPage(post);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          width: ScreenUtil().screenWidth,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(Get.find<PostController>().getPostImageUrl(post)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  width: ((ScreenUtil().screenWidth / 2) - 10),
                  child: Column(
                    children: [
                      Container(
                        width: ((ScreenUtil().screenWidth / 2) - 10),
                        padding: EdgeInsets.all(9.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.black54.withOpacity(0.7),
                        ),
                        child: AppText(
                          post.title!.rendered!,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
