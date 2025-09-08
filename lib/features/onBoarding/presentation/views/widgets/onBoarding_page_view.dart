import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

import 'package:gap/gap.dart';

import 'page_view_items.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.currentPage,
  });
  final PageController pageController;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItems(
          isVisivle: currentPage == 0,
          image: "assets/images/page_view_img.svg",
          backGroundImage: "assets/images/back_ground_img1.svg",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحبًا بك في",
                style: AppTextStyle.bold23,
              ),
              Gap(5),
              Text(
                "HUB",
                style: AppTextStyle.bold23
                    .copyWith(color: AppColors.secondaryColor),
              ),
              Text("Fruit",
                  style: AppTextStyle.bold23
                      .copyWith(color: AppColors.primaryColor)),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
        ),
        PageViewItems(
            isVisivle: currentPage == 1 - 1,
            image: "assets/images/page_view_img2.svg",
            backGroundImage: "assets/images/back_ground_img1.svg",
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ابحث وتسوق",
                  style: AppTextStyle.bold23,
                ),
              ],
            ),
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية"),
      ],
    );
  }
}
