import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CurrencyConverterApp extends StatefulWidget {
  const CurrencyConverterApp({super.key});

  @override
  State<CurrencyConverterApp> createState() => _CurrencyConverterAppState();
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class _CurrencyConverterAppState extends State<CurrencyConverterApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  Widget build(BuildContext buildContext) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(buildContext).requestFocus(FocusNode());
      },
      child: MaterialApp.router(
        routerConfig: goRouter,
        builder: (buildContext, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: FlutterEasyLoading(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: IntrinsicHeight(
                      child: child ?? const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        theme: ThemeData(
          cardColor: Colors.white,
          canvasColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          fontFamily: AppFonts.ibmRegular,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Currency Converter',
        localizationsDelegates: buildContext.localizationDelegates,
        supportedLocales: buildContext.supportedLocales,
        locale: buildContext.locale,
      ),
    );
  }
}
