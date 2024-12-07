import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class BaseAppBar extends StatefulWidget {
  BaseAppBar({super.key, required this.title});

  String title = "";

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorNeutral50,
      surfaceTintColor: AppColors.colorNeutral50,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: Transform.rotate(
          angle: 180 * math.pi / 180,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            color: AppColors.colorBlue800,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      title: Text(
        widget.title,
        style: const TextStyle(
            color: AppColors.colorBlue700,
            fontFamily: AppFonts.ibmSemiBold,
            fontSize: 14),
      ),
    );
  }
}
