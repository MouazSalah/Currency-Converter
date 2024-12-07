import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/extensions/ext_flags.dart';
import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/widgets/country_flag_image.dart';
import 'package:flutter/material.dart';

class CurrencyListviewItem extends StatelessWidget {
  Currency currency;
  final Function(Currency) onPressed;

  CurrencyListviewItem({
    Key? key,
    required this.currency,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final countryCode = currencyToCountry[currency.id];

    return InkWell(
      onTap: () {
        onPressed.call(currency);
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CurrencyFlag(currencyCode: countryCode ?? "USD"),
            horizontalSpace(6),
            Text(
                currency.id.toString(),
                style: const TextStyle(
                    color: AppColors.colorBlue700,
                    fontSize: 13,
                    fontFamily: AppFonts.ibmRegular)),
          ],
        ),
      ),
    );
  }
}