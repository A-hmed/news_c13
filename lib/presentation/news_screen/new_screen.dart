import 'package:flutter/material.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/presentation/common/widgets/custom_scaffold.dart';
import 'package:news_app_c13/presentation/news_screen/articles_list.dart';
import 'package:news_app_c13/presentation/news_screen/news_screen_viewmodel.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = '/newsScreen';
  String categoryId = "";

  NewsScreen({super.key, this.categoryId = ""});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late ThemeProvider themeProvider;

  NewsScreenViewModel viewModel = NewsScreenViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: CustomScaffold(
          title: widget.categoryId.isEmpty ? "General" : widget.categoryId,
          body: Consumer<NewsScreenViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.sourceApi.hasError) {
                return buildError(viewModel.sourceApi.error);
              } else if (viewModel.sourceApi.hasData) {
                return buildTabs(viewModel.sourceApi.getData<List<SourceDM>>());
              } else {
                return buildLoading();
              }
            },
          )),
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
          ElevatedButton(
              onPressed: () {
                viewModel.getSources(widget.categoryId);
              },
              child: Text("Try again"))
        ],
      );

  Widget buildLoading() => Center(child: CircularProgressIndicator());

  showLoading() {}
}

///S
