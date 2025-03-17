import 'package:flutter/material.dart';

class PaddedContainer extends StatelessWidget {
  final Widget child;

  const PaddedContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // 16px horizontal padding
      child: child,
    );
  }
}
