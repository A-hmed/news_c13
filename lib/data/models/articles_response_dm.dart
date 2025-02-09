import 'article_dm.dart';

class ArticlesResponseDm {
  String? status;
  num? totalResults;
  List<ArticleDM>? articles;

  ArticlesResponseDm({
    this.status,
    this.totalResults,
    this.articles,
  });

  ArticlesResponseDm.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(ArticleDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
