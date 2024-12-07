import 'dart:io';

import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:contactcars_app_retail/db/api/url_provider.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void shareAppViaWhatsApp(BuildContext buildContext) async {
  // true.handleLoading();

  // final lang = SharedPref.getLang();

  // final makeName = model.makeNameEn;
  // final modelName = model.modelNameEn;

  // final engine =
  //     model.engineDescription?.replaceAll(" ", "-").replaceAll("/", "-");
  // final status = _getStatus(model.status ?? 1);

  // var fullUrl =
  //     "${UrlProvider.config.domainBaseURL}/$lang/${_getMotorLinkCategory(model.status ?? 1)}/$makeName-$modelName/${model.id}?status=$status";
  // if (engine != null && engine.isNotEmpty && engine != "-1") {
  //   fullUrl += "-$engine";
  // }
  // final shortLink = await createTinyURL(fullUrl);
  // false.handleLoading();

  // String phone = "01091860375";

  // String welcomeMessage =
  //     "مرحباً، بكلمك بخصوص الموتوسيكل المعروض على كونتكت كارز";
  // String message = "$welcomeMessage" "\n\n$shortLink";

  // final whatsappUrl = Platform.isIOS
  //     ? "https://api.whatsapp.com/send?phone=+2$phone&text=${Uri.encodeFull(message)}"
  //     : "https://wa.me/+2$phone?text=${Uri.encodeFull(message)}";

  // if (await canLaunch(whatsappUrl)) {
  //   await launch(whatsappUrl);
  // } else {
  //   // If WhatsApp is not installed, open a web page instead
  //   final webUrl =
  //       "https://web.whatsapp.com/send?phone=+2$phone&text=${Uri.encodeFull(message)}";
  //   if (await canLaunch(webUrl)) {
  //     await launch(webUrl);
  //   } else {
  //     throw 'Could not launch $webUrl';
  //   }
  // }
}
