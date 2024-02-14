import 'package:flutter/material.dart';
import 'package:trail/core/utilities/styles.dart';
import 'package:trail/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:trail/features/home/presentation/views/widgets/custome_appbar.dart';
import 'package:trail/features/home/presentation/views/widgets/custome_booklist_view.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              BooksListView(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
