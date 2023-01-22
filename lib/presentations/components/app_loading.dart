import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        JumpingDots(
          color: Colors.yellow,
          radius: 10,
          numberOfDots: 3,
          innerPadding: 5,
          animationDuration: Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
