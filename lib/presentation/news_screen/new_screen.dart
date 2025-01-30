import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_c13/data/models/article_model.dart';
import 'package:news_app_c13/presentation/common/widgets/custom_scaffold.dart';
import 'package:news_app_c13/presentation/news_screen/widgets/article_item_widget.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = '/newsScreen';
  NewsScreen({super.key});

  // ToDo  fake list from apis
  final List<String> tabsList = [
    'al ahly',
    'on',
    'nile',
    'dmc',
    'al ahly',
    'on',
    'nile',
    'dmc' 'al ahly',
    'on',
    'nile',
    'dmc',
    'bein'
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider= Provider.of<ThemeProvider>(context);

    return CustomScaffold(
      title: 'Sport',
      body: DefaultTabController(
        length: tabsList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
                indicatorColor:themeProvider.isDarkTheme ? ColorManger.white : ColorManger.black ,
                isScrollable: true,

                tabAlignment: TabAlignment.start,
                tabs: tabsList
                    .map(
                      (tab) => Tab(
                        text: tab,
                      ),
                    )
                    .toList()),
            Expanded(
              child: TabBarView(
                  children: tabsList.map(
                (tab) {
                  final filterArticle = ArticleModel.articlesList
                      .where(
                        (article) => article.title!
                            .toLowerCase()
                            .contains(tab.toLowerCase()),
                      )
                      .toList();

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final article = filterArticle[index];
                        return ArticleItemWidget(
                            image: article.image ?? '',
                            title: article.title ?? '',
                            author: article.author ?? '',
                            date: DateFormat('h:mm a')
                                .format(article.dateTime ?? DateTime.now()));
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: filterArticle.length);
                },
              ).toList()),
            )
          ],
        ),
      ),
    );
  }
}
