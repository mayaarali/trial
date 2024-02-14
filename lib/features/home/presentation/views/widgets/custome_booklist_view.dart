import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trail/core/widgets/custome_loading_indicator.dart';
import 'package:trail/core/widgets/error_widget.dart';
import 'package:trail/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:trail/features/home/presentation/views/widgets/custome_listview_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              //padding: EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      // MagicRouter.navigateTo(const BookDetailsView(bookModel: bookModel)
                      GoRouter.of(context).push(
                        '/bookdetailsview',
                        extra: state.books[index],
                      );
                    },
                    child: CustomListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomeErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomeLoadingIndicator();
        }
      },
    );
  }
}
