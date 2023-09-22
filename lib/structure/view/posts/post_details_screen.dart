import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/app_fonts.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/presenter/post_controller.dart';
import 'package:rapexa_academy/structure/presenter/product_controller.dart';
import '../../../infrastructure/constants/app_colors.dart';
import '../../../infrastructure/widgets/app_divider.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostDetailScreenState();
  }
}

class PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
        autoRemove: false,
        builder: (controller) {
          return BasePage(
            appBar: AppBar(
              backgroundColor: AppColors.appColor,
              title: AppText(controller.selectedPost.title!.rendered!, fontSize: AppFonts.s16,),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          controller.getPostImageUrl(controller.selectedPost)),
                  Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Column(
                      children: [
                        const AppDivider(),
                        Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: RepaintBoundary(
                            child: HtmlWidget(
                              controller.selectedPost.content!.rendered!,
                              textStyle:
                                  TextStyle(fontFamily: AppFonts.appFont),
                              onTapImage: (imageData){
                                Get.find<ProductController>().rp?.list?.forEach((element) {
                                  print("");
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
