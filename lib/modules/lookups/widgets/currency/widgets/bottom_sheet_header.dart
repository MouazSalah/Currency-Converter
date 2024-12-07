import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/widgets/close_button_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  const BottomSheetHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.ibmBold,
                )),
            const Spacer(),
            CloseButtonBottomSheet(onClick: () {
              Navigator.of(context).pop();
            }),
          ],
        ),
        verticalSpace(12),
        const Divider(
          height: 1,
          color: AppColors.colorNeutral200,
        ),
      ],
    );
  }
}
