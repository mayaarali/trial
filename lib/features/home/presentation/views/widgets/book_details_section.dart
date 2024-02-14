import 'package:flutter/material.dart';
import 'package:trail/core/utilities/styles.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';
import 'package:trail/features/home/presentation/views/widgets/books_acton.dart';
import 'package:trail/features/home/presentation/views/widgets/custom_best_seller_item.dart';
import 'package:trail/features/home/presentation/views/widgets/custome_listview_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .35),
          child: CustomListViewItem(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          maxLines: 3,
        ),
        const SizedBox(
          height: 4,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Styles.textStyle16.copyWith(
              fontFamily: 'PlayfairDisplay',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const BookRatingText(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
        BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
