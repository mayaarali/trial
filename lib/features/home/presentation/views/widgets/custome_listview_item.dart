import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        // aspectRatio: 2.6/4,
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          // placeholder: (context, url) => const Center(
          //    child: CircularProgressIndicator(),
          //),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline_rounded),
        ),

        /*  child: Container(
          // height: 100,
          //width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          //  color: Colors.white,
            image:  DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage 
                (imageUrl)
               // ('https://images.penguinrandomhouse.com/cover/9780593422182'
                  // imageUrl,
                //  ('https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                   // )
                    ),
          ),
        ),*/
      ),
    );
  }
}
