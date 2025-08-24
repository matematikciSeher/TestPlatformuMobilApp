import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLogo extends StatelessWidget {
  final AnimationController controller;
  final Color backgroundColor;

  const AnimatedLogo({
    super.key,
    required this.controller,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    ));

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(
            opacity: fadeAnimation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Container(
                width: 90.r,
                height: 90.r,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
