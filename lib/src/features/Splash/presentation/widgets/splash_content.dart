import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'animated_logo.dart';
import 'animated_text.dart';

class SplashContent extends StatelessWidget {
  final AnimationController? logoController;
  final AnimationController? textController;
  final Color backgroundColor;
  final Color textColor;
  final String appName;

  const SplashContent({
    super.key,
    required this.logoController,
    required this.textController,
    required this.backgroundColor,
    required this.textColor,
    this.appName = 'Sorucam',
  });

  @override
  Widget build(BuildContext context) {
    // Animasyonlar henüz initialize edilmemişse basit UI göster
    if (logoController == null || textController == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90.r,
            height: 90.r,
            color: Colors.red,
          ),
          SizedBox(width: 10.w),
          Text(
            appName,
            style: TextStyle(
              color: textColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedLogo(
          controller: logoController!,
          backgroundColor: backgroundColor,
        ),
        SizedBox(width: 10.w),
        AnimatedText(
          controller: textController!,
          text: appName,
          textColor: textColor,
        ),
      ],
    );
  }
}
