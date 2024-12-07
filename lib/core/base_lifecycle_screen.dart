import 'package:flutter/material.dart';
import 'package:contactcars_app_retail/currency_app.dart';

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState();
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    whenScreenOpened();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPush() {
    // Called when this screen is pushed onto the navigation stack
  }

  @override
  void didPopNext() {
    whenScreenOpened();
  }

  @override
  void didPushNext() {
    whenScreenClosed();
  }

  @override
  void didPop() {
    whenScreenTerminated();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    whenScreenTerminated();
    super.dispose();
  }

  void whenScreenOpened() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void whenScreenClosed() {
    // To be implemented by subclasses
  }

  void whenScreenTerminated() {
    // To be implemented by subclasses
  }

  @override
  Widget build(
      BuildContext context); // Abstract method to be implemented by subclasses
}
