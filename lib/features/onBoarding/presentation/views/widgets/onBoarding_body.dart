import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/service/shared_pref_singlton.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_screen.dart';
import 'onBoarding_page_view.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //todo...pageView body
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
            currentPage: currentPage,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          onTap: (value) {},
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(green: 0.6),
          ),
        ),
        Gap(20),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: CustomButton(
              buttonText: "ابدأ الان",
              onPressed: () {
                Prefs.setBool(isOnboardingSeen, true);
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routName);
              },
              width: double.infinity,
            ),
          ),
        )
      ],
    );
  }
}
