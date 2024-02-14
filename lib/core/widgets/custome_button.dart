import 'package:flutter/material.dart';
import 'package:trail/core/utilities/styles.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.backgroundColor,
    required this.textcolor,
    this.borderRadius,
    required this.textbutton,
    this.fontSize,
    this.onPressed,
  });

  final Color backgroundColor;
  final Color textcolor;
  final BorderRadius? borderRadius;
  final String textbutton;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          textbutton,
          style: Styles.textStyle18.copyWith(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
