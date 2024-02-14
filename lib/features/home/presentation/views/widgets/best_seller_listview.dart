import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trail/core/widgets/custome_loading_indicator.dart';
import 'package:trail/core/widgets/error_widget.dart';
import 'package:trail/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:trail/features/home/presentation/views/widgets/custom_best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.builder(
            //shrinkWrap: true,//de m3naha enu hyakhod hagm elitems bs
            physics:
                const NeverScrollableScrollPhysics(), //hnwa hw2af scroll ellist view nafsaha
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: BestSellerItem(
                  bookModel: state.books[index],
                ),
              );
            });
      } else if (state is NewestBooksFailure) {
        return CustomeErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomeLoadingIndicator();
      }
    });
  }
}
