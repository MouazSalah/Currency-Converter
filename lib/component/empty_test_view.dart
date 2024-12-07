import 'package:flutter/material.dart';

class EmptyTextWidget extends StatelessWidget {
  String text;
  EmptyTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Text(text)));
  }
}
