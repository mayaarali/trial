import 'package:flutter/material.dart';
import 'package:trail/core/utilities/styles.dart';

class CustomeErrorWidget extends StatelessWidget {
  const CustomeErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        textAlign: TextAlign.center,
        style: Styles.textStyle18,
      ),
    );
  }
}
