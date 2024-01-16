import 'package:flutter/material.dart';

class BackgroundCardWidget extends StatelessWidget {
  final Widget? child;
  const BackgroundCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
