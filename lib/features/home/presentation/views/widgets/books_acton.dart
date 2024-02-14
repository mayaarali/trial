import 'package:flutter/material.dart';
import 'package:trail/core/utilities/function/launch_url.dart';
import 'package:trail/core/widgets/custome_button.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: CustomeButton(
              backgroundColor: Colors.white,
              textcolor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
              textbutton: 'Free',
            ),
          ),
          Expanded(
              child: CustomeButton(
            onPressed: () async {
              /* Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
                */

              // }
              //}
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            backgroundColor: const Color(0xffEF8262),
            textcolor: Colors.white,
            fontSize: 15,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18)),
            textbutton: getText(bookModel),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (!(bookModel.volumeInfo.previewLink == null)) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
