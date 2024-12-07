import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CloseButtonBottomSheet extends StatelessWidget {
  final Function? onClick;
  const CloseButtonBottomSheet({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            decoration: const BoxDecoration(
              color: AppColors.colorBlue100,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 9,
                  height: 9,
                  child: Image.asset("assets/icons/ic_close.png"),
                ),
                horizontalSpace(6),
                Text(
                  'close'.tr(),
                  style: const TextStyle(
                      fontSize: 11,
                      fontFamily: AppFonts.ibmSemiBold,
                      color: AppColors.colorBlue500Base),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}