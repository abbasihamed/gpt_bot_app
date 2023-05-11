import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        JumpingDots(
          color: Colors.yellow,
          radius: 10,
          numberOfDots: 3,
          innerPadding: 5,
          animationDuration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
