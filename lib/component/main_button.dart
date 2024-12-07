import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:flutter/material.dart';

enum MainButtonType { blue, orange, green }

class MainButton extends StatelessWidget {
  String text;
  int? borderRadius;
  int? width;
  int? height;
  Widget? icon;
  MainButtonType? type;
  Function onPressed;
  double? fontSize;

  MainButton(
      {super.key,
      required this.text,
      this.width,
      this.height,
      this.icon,
      this.borderRadius,
      required this.type,
      this.fontSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        width: width?.toDouble() ?? double.infinity,
        height: height?.toDouble() ?? 49.0,
        decoration: BoxDecoration(
          color: type == MainButtonType.blue
              ? AppColors.colorBlue500Base
              : type == MainButtonType.orange
                  ? AppColors.colorOrange500Base
                  : AppColors.whatsappColor,
          borderRadius: borderRadius == 0
              ? null
              : const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              Text(
                text,
                style: TextStyle(
                    fontSize: fontSize ?? 15,
                    fontFamily: AppFonts.ibmSemiBold,
                    color: AppColors.colorWhite900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainButtonWithIcon extends StatelessWidget {
  String text;
  double? width;
  double? height;
  Widget? icon;
  MainButtonType? type;
  Function onPressed;
  double? fontSize;

  MainButtonWithIcon(
      {super.key,
      required this.text,
      this.width,
      this.height,
      this.icon,
      this.fontSize,
      required this.type,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 49.0,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: type == MainButtonType.blue
              ? AppColors.colorBlue500Base
              : AppColors.colorOrange500Base,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 20, child: icon),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: fontSize ?? 13,
                    fontFamily: AppFonts.ibmSemiBold,
                    color: AppColors.colorWhite900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
