import 'package:flutter/material.dart';
import 'package:trail/core/utilities/styles.dart';
import 'package:trail/features/search/presentation/views/widgets/custome_search_textfield.dart';
import 'package:trail/features/search/presentation/views/widgets/search_result_listview.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Search Results ",
            style: Styles.textStyle18,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
