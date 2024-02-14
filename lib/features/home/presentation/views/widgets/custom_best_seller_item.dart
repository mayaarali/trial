import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:trail/core/utilities/styles.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';
import 'package:trail/features/home/presentation/views/widgets/custome_listview_item.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // MagicRouter.navigateTo(BookDetailsView(bookModel: bookModel));
        //bb3at elmidel m3 elnavigation
        GoRouter.of(context).push('/bookdetailsview', extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 150,
          child: Row(
            children: [
              CustomListViewItem(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
              /* AspectRatio(
                aspectRatio: 2.4 / 4,
                child: Container(
                  //  height: 100,
                  //  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // color: Colors.white,
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://images.penguinrandomhouse.com/cover/9780593422182')
                        //image: AssetImage(AssetsData.cover),
                        ),
                  ),
                ),
              ),
              */
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        style: Styles.textStyle30,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: Styles.textStyle16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle18,
                        ),
                        Spacer(),
                        BookRatingText(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookRatingText extends StatelessWidget {
  const BookRatingText(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          const Icon(
            FontAwesomeIcons.solidStar, //size: 15,
            color: Color(0xffFFDD4F),
            size: 16,
          ),
          const SizedBox(
            width: 6.3,
          ),
          const Text(
            '4.8',
            style: Styles.textStyle16,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '(2390)',
            style: Styles.textStyle16.copyWith(
              color: const Color(0xff707070),
            ),
          ),
        ],
      ),
    );
  }
}
