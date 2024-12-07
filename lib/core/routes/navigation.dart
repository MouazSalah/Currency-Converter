import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushToWithExtra(
    BuildContext buildContext, String routeName, Map<String, dynamic> extra) {
  buildContext.push(routeName, extra: extra);
}

void pushTo(BuildContext buildContext, String routeName) {
  buildContext.push(routeName);
}

void pushBaseWithExtra(BuildContext buildContext, String routeName,
    {Object? extra}) {
  buildContext.go(routeName, extra: extra);
}

void pushReplacement(BuildContext buildContext, String routeName,
    {Object? extra}) {
  buildContext.pushReplacement(routeName, extra: extra);
}

Future<T?> pushToAndListen<T extends Object?>(
    BuildContext context, String location,
    {Object? extra}) {
  return GoRouter.of(context).push<T>(location, extra: extra);
}
