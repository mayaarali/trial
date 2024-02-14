import 'package:flutter/material.dart';
import 'package:trail/features/home/presentation/views/widgets/custom_best_seller_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //shrinkWrap: true,//de m3naha enu hyakhod hagm elitems bs
        //physics: const NeverScrollableScrollPhysics(),//hnwa hw2af scroll ellist view nafsaha
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            //  child: BestSellerItem(),
            child: Text("data"),
          );
        });
  }
}
