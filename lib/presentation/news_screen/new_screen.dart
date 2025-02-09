import 'package:flutter/material.dart';
import 'package:news_app_c13/data/api/api_manager.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/presentation/common/widgets/custom_scaffold.dart';
import 'package:news_app_c13/presentation/news_screen/articles_list.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = '/newsScreen';
  String categoryId = "";

  NewsScreen({super.key, this.categoryId = ""});

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return CustomScaffold(
      title: categoryId.isEmpty ? "General" : categoryId,
      body: FutureBuilder<List<SourceDM>>(
          future: ApiManager.getSources(categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return buildError(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return buildTabs(snapshot.data ?? []);
            } else {
              return buildLoading();
            }
          }),
    );
  }

  Widget buildTabs(List<SourceDM> sources) => DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: themeProvider.isDarkTheme
                    ? ColorManger.white
                    : ColorManger.black,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: sources
                    .map(
                      (source) => Tab(
                        text: source.name,
                      ),
                    )
                    .toList()),
            Expanded(
              child: TabBarView(
                  children: sources
                      .map(
                        (source) => ArticlesList(sourceId: source.id!),
                      )
                      .toList()),
            )
          ],
        ),
      );

  Widget buildError(String errorMessage) => Column(
        children: [
          Text(errorMessage),
          ElevatedButton(onPressed: () {}, child: Text("Try again"))
        ],
      );

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
