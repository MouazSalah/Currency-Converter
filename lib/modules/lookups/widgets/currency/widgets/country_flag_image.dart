// lib/widgets/currency_flag.dart

import 'package:contactcars_app_retail/core/extensions/ext_flags.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CurrencyFlag extends StatelessWidget {
  final String currencyCode;
  final double width;
  final double height;

  const CurrencyFlag({
    Key? key,
    required this.currencyCode,
    this.width = 48.0,
    this.height = 36.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryCode = currencyToCountry[currencyCode];

    if (countryCode == null || countryCode.isEmpty) {
      // Handle cases with no associated country
      // Display a default icon or a placeholder
      return Icon(
        Icons.currency_exchange,
        size: width,
      );
    }

    // Special handling for EUR
    if (currencyCode == "EUR") {
      // EU flag URL
      return CachedNetworkImage(
        imageUrl: 'https://flagpedia.net/data/flags/icon/72x54/eu.png',
        width: width,
        height: height,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }

    // Construct the flag URL
    final flagUrl =
        'https://flagpedia.net/data/flags/icon/72x54/${countryCode.toLowerCase()}.png';

    return CachedNetworkImage(
      imageUrl: flagUrl,
      width: width,
      height: height,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
