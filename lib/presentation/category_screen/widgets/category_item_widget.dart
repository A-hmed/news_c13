import 'package:flutter/material.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.image, required this.index, this.onTap});
final String image;

final int index;
final void Function()? onTap;
@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap:onTap ,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image)),
            Positioned(
                bottom: 10,
                right: index.isEven ? 10 : null,
                left: index.isOdd ? 10 : null,
                child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: ColorManger.black.withOpacity(.5)
              ),
              child: FittedBox(
                child: Row(
                  children: [
                    Text('view all'),
                 SizedBox(width: 10,),
                 CircleAvatar(

                     child: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
