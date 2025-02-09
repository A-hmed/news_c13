import 'package:flutter/material.dart';
import 'package:news_app_c13/data/api/api_manager.dart';
import 'package:news_app_c13/data/models/article_dm.dart';
import 'package:news_app_c13/presentation/news_screen/widgets/article_item_widget.dart';

class ArticlesList extends StatelessWidget {
  final String sourceId;

  const ArticlesList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleDM>>(
      future: ApiManager.getArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return buildError(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return buildArticles(snapshot.data!);
        } else {
          return buildLoading();
        }
      },
    );
  }

  Widget buildArticles(List<ArticleDM> articles) {
    return ListView.separated(
        itemBuilder: (context, index) {
          var article = articles[index];
          return ArticleItemWidget(
              image: article.urlToImage ?? '',
              title: article.title ?? '',
              author: article.author ?? '',
              date: article.publishedAt ?? "");
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: articles.length);
  }

  Widget buildError(String errorMessage) => Column(
        children: [
          Text(errorMessage),
          ElevatedButton(onPressed: () {}, child: Text("Try again"))
        ],
      );

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
