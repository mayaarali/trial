import 'package:flutter/material.dart';
import 'package:trail/core/utilities/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 50,
          ),
          const Spacer(),
          /* IconButton(
              onPressed: () {
                //  MagicRouter.goBack();
                GoRouter.of(context).push('/searchview');
              },
              icon: const Icon(
                //FontAwesomeIcons.magnifyingGlass
                Icons.search,
                size: 25,
              ))
              */
        ],
      ),
    );
  }
}
