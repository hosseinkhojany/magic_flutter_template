import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/app_colors.dart';
import 'package:rapexa_academy/infrastructure/constants/app_fonts.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_button.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_divider.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/presenter/product_controller.dart';

import '../../../../infrastructure/widgets/app_video_player.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailScreenState();
  }
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ExpandableController expandableController = ExpandableController();
  bool isExpanded = false;

  @override
  void initState() {
    expandableController.addListener(() {
      setState(() {
        isExpanded = expandableController.expanded;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      autoRemove: false,
      builder: (controller) {
        return BasePage(
          appBar: AppBar(
            backgroundColor: AppColors.appColor,
            title: AppText(controller.selectedProduct.name!),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl: controller.selectedProduct.images![0].src!),
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.r),
                        child: Column(
                          children: [
                            if (!controller.selectedProduct.isFree)
                              Column(
                                children: [
                                  AppButton(
                                      text: controller
                                          .selectedProduct.productPriceStr,
                                      onPressed: () {}),
                                  const AppDivider(),
                                ],
                              ),
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: ExpandablePanel(
                                controller: expandableController,
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: true,
                                  hasIcon: false,
                                ),
                                collapsed: Stack(
                                  children: [
                                    Visibility(
                                      visible: isExpanded,
                                      child: HtmlWidget(
                                        controller.selectedProduct.description!,
                                        textStyle: TextStyle(
                                          fontFamily: AppFonts.appFont,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: !isExpanded,
                                      child: SizedBox(
                                        width: ScreenUtil().screenWidth,
                                        height: 200,
                                        child: HtmlWidget(
                                          controller.selectedProduct.description!,
                                          textStyle: TextStyle(
                                            fontFamily: AppFonts.appFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (!isExpanded)
                                      Positioned(
                                        right: 0,
                                        left: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            expandableController.expanded = true;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                            ),
                                            width: ScreenUtil().screenWidth,
                                            height: 60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppText(
                                                  "ادامه توضیحات",
                                                  fontSize: AppFonts.s15,
                                                ),
                                                ExpandableIcon(
                                                  theme:
                                                      const ExpandableThemeData(
                                                    expandIcon:
                                                        Icons.arrow_drop_down,
                                                    collapseIcon:
                                                        Icons.arrow_drop_down,
                                                    iconSize: 28.0,
                                                    iconRotationAngle: pi / 2,
                                                    iconPadding:
                                                        EdgeInsets.only(right: 5),
                                                    hasIcon: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                expanded: RepaintBoundary(
                                  child: Column(
                                    children: [
                                      HtmlWidget(
                                        controller.selectedProduct.description!,
                                        textStyle: TextStyle(
                                          fontFamily: AppFonts.appFont,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          expandableController.expanded = false;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.9),
                                            border:
                                                Border.all(color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          width: ScreenUtil().screenWidth,
                                          height: 60,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppText(
                                                "بستن توضیحات",
                                              ),
                                              ExpandableIcon(
                                                theme: const ExpandableThemeData(
                                                  expandIcon:
                                                      Icons.arrow_drop_down,
                                                  collapseIcon:
                                                      Icons.arrow_drop_down,
                                                  iconSize: 28.0,
                                                  iconPadding:
                                                      EdgeInsets.only(right: 5),
                                                  hasIcon: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (controller.selectedProduct.freeVideos != null)
                    for (var video in controller.selectedProduct.freeVideos!)
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Container(
                          height: 250,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: 220,
                                  width: ScreenUtil().screenWidth,
                                  child: AppVideoPlayer(
                                    link: video.link,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: AppText(video.title)
                              ),
                              Container()
                            ],
                          ),
                        ),
                      )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
