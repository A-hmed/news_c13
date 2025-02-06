import 'package:flutter/material.dart';
import 'package:news_app_c13/data/api/api_managers.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/presentation/common/widgets/custom_scaffold.dart';
import 'package:news_app_c13/presentation/news_screen/articles_list.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = '/newsScreen';
  final String categoryId;

  NewsScreen({super.key, this.categoryId = ""});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      title: 'Sport',
      body: FutureBuilder<List<SourceDM>>(
          future: ApiManager.getSources(widget.categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return buildErrorWidget(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return buildPageBody(snapshot.data ?? []);
            } else {
              return buildLoading();
            }
          }),
    );
  }

  Widget buildPageBody(List<SourceDM> sources) => DefaultTabController(
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
                        text: source.name ?? "",
                      ),
                    )
                    .toList()),
            Expanded(
              child: TabBarView(
                  children: sources.map(
                (source) {
                  return ArticlesList(
                    sourceId: source.id ?? "",
                  );
                },
              ).toList()),
            )
          ],
        ),
      );

  Widget buildErrorWidget(String error) => Column(
        children: [
          Container(
            child: Text(error),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Retry"))
        ],
      );

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
