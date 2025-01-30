import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.author,
      required this.date});

  final String image;
  final String title;
  final String author;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManger.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: image,
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 1,
                )),
              )),
          Text(title),
          Row(
            children: [
              Text(author),
              Spacer(),
              Text(date),
            ],
          )
        ],
      ),
    );
  }
}
