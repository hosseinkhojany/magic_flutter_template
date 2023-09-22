
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/app_colors.dart';
import 'package:rapexa_academy/infrastructure/constants/app_fonts.dart';
import 'package:rapexa_academy/infrastructure/constants/app_images.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_button.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_divider.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_text.dart';
import 'package:rapexa_academy/infrastructure/widgets/base_page.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';
import 'package:rapexa_academy/structure/presenter/product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        autoRemove: false,
        builder: (controller) {
          return controller.rp == null ? Container() : BasePage(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: controller.rp!.list!.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: index == 0
                            ? Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 30.w,
                                    top: 20.h,
                                    left: 30.w,
                                    child: AppText(
                                      "دوره های اموزشی",
                                      fontSize: AppFonts.s24,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            DurehItem(product: controller.rp!.list![index]),
                          ],
                        )
                        //TODO: handle my product
                            : index + 1 == controller.rp!.list!.length
                            ? Column(
                          children: [
                            DurehItem(product: controller.rp!.list![index]),
                            Divider(),
                            SizedBox(height: 15),
                            AppText(
                              "دوره های من",
                              fontSize: AppFonts.s24,
                            ),
                            SizedBox(height: 15),
                            DurehManItem(product: controller.rp!.list![index]),
                            DurehManItem(product: controller.rp!.list![index]),
                          ],
                        )
                            : DurehItem(product: controller.rp!.list![index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
    );
  }
}

//TODO: https://api.flutter.dev/flutter/material/ListTile-class.html

class DurehItem extends StatelessWidget {
  late Product product;
  DurehItem({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.r),
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
            ]),
        width: ScreenUtil().screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(product.images![0].src!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  if (product.isDiscount)
                    Positioned(
                      left: 0,
                      child: Banner(
                        color: AppColors.appColor,
                        location: BannerLocation.topEnd,
                        message: product.percentDiscount,
                      ),
                    ),
                ],
              ),
            ),
            Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(product.name!, fontSize: AppFonts.s17),
                        SizedBox(height: 10.h),
                        AppText(product.teacherName ?? "", fontSize: AppFonts.s17),
                      ],
                    ),
                  ),
                  AppDivider(),
                  Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (product.isDiscount && !product.isFree)
                          Row(
                            children: [
                              AppText("\$ ${product.regularPrice.toString()}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.redAccent,
                                  decorationThickness: 3,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  color: AppColors.appColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.r),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: AppText(
                                  "\$ ${product.price!}",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        if (!product.isDiscount && !product.isFree) AppText(product.productPriceStr),
                        if (product.isFree)
                          Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: AppText(
                              product.productPriceStr,
                              color: Colors.white,
                            ),
                          ),
                        SizedBox(height: 10),
                        AppButton(
                          text: "مشاهده دوره",
                          fontSize: 18.sp,
                          onPressed: () {
                            Get.find<ProductController>().goToDetailPage(product);
                          },
                          height: 40,
                          width: 130,
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class DurehManItem extends StatelessWidget {
  Product product;
  DurehManItem({super.key, required this.product});

  bool isDiscount = true;
  bool isFree = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.r),
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
            ]),
        width: ScreenUtil().screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r)),
                      image: DecorationImage(
                        image: Image.asset(AppImages.appImage).image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("دوره مستر پایتون", fontSize: AppFonts.s17),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 10),
                              AppButton(
                                text: "مشاهده دوره",
                                fontSize: 18.sp,
                                onPressed: () {
                                  Get.find<ProductController>().goToDetailPage(product);
                                },
                                height: 40,
                                width: 130,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
