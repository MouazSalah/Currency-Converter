import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/routes/app_routes.dart';
import 'package:contactcars_app_retail/core/routes/navigation.dart';
import 'package:contactcars_app_retail/core/utils/assets_manager.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:contactcars_app_retail/modules/intro/onboard.dart';
import 'package:contactcars_app_retail/modules/intro/onboard_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                _headerView(),
                _pagerView(),
                _bottomButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _headerView() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.appBarLogo),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "آهلا بيك في كونتكت كازر",
            style: TextStyle(
              fontFamily: AppFonts.ibmBold,
              fontSize: 24,
              color: AppColors.colorBlue500Base,
            ),
          )
        ],
      ),
    );
  }

  Expanded _pagerView() {
    return Expanded(
      child: PageView.builder(
        itemCount: demo_data.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        itemBuilder: (context, index) => OnboardContent(
          image: demo_data[index].image,
          title: demo_data[index].title,
          description: demo_data[index].description,
          pageIndex: _pageIndex,
        ),
      ),
    );
  }

  Widget _bottomButton(BuildContext buildContext) {
    return InkWell(
      onTap: () {
        if (_pageIndex == demo_data.length - 1) {
          SharedPref.setIsOnboardingShowed(true);
          pushTo(buildContext, Routes.homeScreen);
        } else {
          _pageController.nextPage(
              duration: const Duration(microseconds: 300),
              curve: Curves.easeIn);
        }
      },
      child: Container(
        width: 300,
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.colorBlue500Base,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: Text(
            _pageIndex == demo_data.length - 1 ? "إبدأ الآن" : "التالي",
            style: const TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.ibmSemiBold,
                color: AppColors.colorWhite900),
          ),
        ),
      ),
    );
  }
}
