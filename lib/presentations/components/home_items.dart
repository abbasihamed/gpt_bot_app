import 'package:flutter/material.dart';
import 'package:talk_with_bot/utils/mediaquery.dart';

class HomeItems extends StatelessWidget {
  final List<Color> colors;
  final String itemName;
  final VoidCallback onTap;
  const HomeItems({
    Key? key,
    required this.colors,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        alignment: Alignment.center,
        width: kWidth(context) * 0.47,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          itemName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}
