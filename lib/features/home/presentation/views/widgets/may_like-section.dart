import 'package:flutter/material.dart';
import 'package:trail/core/utilities/styles.dart';
import 'package:trail/features/home/presentation/views/widgets/may_like_listview.dart';

class MayLikeSection extends StatelessWidget {
  const MayLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You Can also like ",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: MayLikeListview(),
        ),
      ],
    );
  }
}
