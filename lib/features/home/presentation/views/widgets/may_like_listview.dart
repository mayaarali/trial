import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trail/core/widgets/custome_loading_indicator.dart';
import 'package:trail/core/widgets/error_widget.dart';
import 'package:trail/features/home/presentation/manger/cubit/similar_books_cubit.dart';
import 'package:trail/features/home/presentation/views/widgets/custome_listview_item.dart';

class MayLikeListview extends StatelessWidget {
  const MayLikeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              //padding: EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CustomListViewItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks!.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailue) {
          return CustomeErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomeLoadingIndicator();
        }
      },
    );
  }
}
