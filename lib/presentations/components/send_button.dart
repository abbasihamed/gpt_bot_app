import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SendButton extends HookWidget {
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onLongPressUp;
  final bool animated;
  final IconData icon;
  const SendButton({
    super.key,
    required this.onTap,
    required this.onLongPress,
    required this.onLongPressUp,
    required this.icon,
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final animController =
        useAnimationController(duration: const Duration(seconds: 1));
    final anim = Tween<double>(begin: 40, end: 60).animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    if (animated) {
      animController.repeat(reverse: true, period: const Duration(seconds: 1));
    } else {
      animController.reverse();
    }
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Stack(
        children: [
          const SizedBox(height: 60, width: 60),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            top: 0,
            child: Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: anim,
                builder: (context, child) {
                  return Container(
                    height: anim.value,
                    width: anim.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(
                        0.30.clamp(0.0, 1.0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            top: 0,
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 22,
                backgroundColor: theme.cardColor,
                child: Icon(
                  icon,
                  color: theme.iconTheme.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
