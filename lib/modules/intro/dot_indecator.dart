import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: 4,
        width: isActive ? 24 : 12,
        decoration: BoxDecoration(
          color: isActive ? AppColors.colorBlue500Base : AppColors.colorBlue200,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
