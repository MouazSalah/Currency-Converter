import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/assets_images.dart';
import 'package:contactcars_app_retail/core/routes/app_routes.dart';
import 'package:contactcars_app_retail/core/routes/navigation.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: AppColors.colorBlue500Base,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.colorBlue500Base,
                  Color(0xFF0031B3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: SvgPicture.asset(
                AssetsImages.newLogo,
                width: 250,
                height: 250,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                AssetsImages.splashCorner,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              AssetsImages.splashCorner,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _navigateToNextScreen() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check if onboarding has been shown
    bool isOnboardingShowed = SharedPref.isOnboardingShowed();

    if (isOnboardingShowed) {
      pushTo(context, Routes.homeScreen); // Replace with your main screen route
    } else {
      // Navigate to the onboarding screen
      pushTo(context, Routes.onBoardingScreen);
    }
  }
}
