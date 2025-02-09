import 'package:flutter/material.dart';
import 'package:news_app_c13/data/models/category_model.dart';
import 'package:news_app_c13/presentation/category_screen/widgets/category_item_widget.dart';
import 'package:news_app_c13/presentation/common/widgets/custom_scaffold.dart';
import 'package:news_app_c13/presentation/news_screen/new_screen.dart';
import 'package:news_app_c13/presentation/resourses/assets_manger.dart';
import 'package:news_app_c13/presentation/resourses/text_manger.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/CategoryScreen';

  CategoryScreen({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(image: AppAssets.lightGeneral, id: ""),
    CategoryModel(image: AppAssets.health, id: "health"),
    CategoryModel(image: AppAssets.sport, id: "sports"),
    CategoryModel(image: AppAssets.technology, id: "technology"),
    CategoryModel(image: AppAssets.science, id: "science"),
    CategoryModel(image: AppAssets.business, id: "business"),
    CategoryModel(image: AppAssets.entertainment, id: "entertainment"),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: AppTextStyle.generalTextStyle(),
            ),
            Text(
              'Here is Some News For You',
              style: AppTextStyle.generalTextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItemWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NewsScreen(
                                        categoryId: category.id,
                                      )));
                        },
                        index: index,
                        image: category.image ?? '');
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: categories.length),
            )
          ],
        ),
      ),
    );
  }
}
