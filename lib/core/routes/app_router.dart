import 'package:contactcars_app_retail/modules/convertion/advanced_filter/screen/currency_converter_screen.dart';
import 'package:contactcars_app_retail/modules/main/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:contactcars_app_retail/core/routes/app_routes.dart';
import 'package:contactcars_app_retail/core/routes/go_router_observer.dart';
import 'package:contactcars_app_retail/modules/intro/on_boarding_page.dart';
import 'package:contactcars_app_retail/modules/splash/splash_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  navigatorKey: navigatorKey,
  observers: [
    GoRouterObserver(),
  ],
  routes: [
    GoRoute(
      path: '/',
      name: "splash",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: Routes.onBoardingScreen,
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: Routes.homeScreen,
      builder: (context, state) => CurrencyConverterScreen(),
    ),
  ],
);

void navigateAsRootWithoutContext(String route, {Object? extra}) {
  goRouter.go(route, extra: extra);
}

void pushToWithoutContext(String route, {Object? extra}) {
  goRouter.push(route, extra: extra);
}
