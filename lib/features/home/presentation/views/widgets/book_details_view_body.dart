import 'package:flutter/material.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';
import 'package:trail/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:trail/features/home/presentation/views/widgets/may_like-section.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              // mainAxisSize:MainAxisSize.min,
              children: [
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const MayLikeSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
