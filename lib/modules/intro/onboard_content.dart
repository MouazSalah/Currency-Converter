import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/modules/intro/dot_indecator.dart';
import 'package:contactcars_app_retail/modules/intro/onboard.dart';
import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageIndex,
  });

  final String image, title, description;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: 250,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                demo_data.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == pageIndex,
                      ),
                    )),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: AppFonts.ibmBold,
            fontSize: 24,
            color: AppColors.colorBlue500Base,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: AppFonts.ibmRegular,
            fontSize: 14,
            color: AppColors.colorDarkBlue400,
          ),
        ),
      ],
    );
  }
}
