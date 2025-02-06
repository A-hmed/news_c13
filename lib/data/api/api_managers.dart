import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app_c13/data/models/article_dm.dart';
import 'package:news_app_c13/data/models/articles_response_dm.dart';
import 'package:news_app_c13/data/models/base_error_response.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/data/models/sources_response_dm.dart';

abstract class ApiManager {
  static const _baseUrl = "https://newsapi.org";
  static const _sourceEndPoint = "/v2/top-headlines/sources";
  static const _articlesEndPoint = "/v2/everything";
  static const _apiKey = "a2803275cc264f5ab82151862011361a";
  static const _defaultHeaders = {"X-Api-Key": _apiKey};

  static Future<List<SourceDM>> getSources(String categoryId) async {
    /// 1- Call api
    Uri url = Uri.parse("$_baseUrl$_sourceEndPoint?category=$categoryId");
    Response serverResponse = await get(url, headers: _defaultHeaders);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      /// 2- Convert json to your model class
      var json = jsonDecode(serverResponse.body); //Converts string to Map
      var sourcesResponse = SourceResponseDM.fromJson(json);
      print("Sources response: ${json}");
      return sourcesResponse.sources!;
    } else {
      var json = jsonDecode(serverResponse.body);
      var errorResponse = BaseErrorResponse.fromJson(json);
      throw errorResponse.message ??
          "Something went wrong please try again later";
    }
  }

  static Future<List<ArticleDM>> getArticles(String sourceId) async {
    /// 1- Call api
    Uri url = Uri.parse("$_baseUrl$_articlesEndPoint?sources=$sourceId");
    Response serverResponse = await get(url, headers: _defaultHeaders);
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      /// 2- Convert json to your model class
      var json = jsonDecode(serverResponse.body); //Converts string to Map
      var articlesResponse = ArticlesResponseDm.fromJson(json);
      print("Sources response: ${json}");
      return articlesResponse.articles!;
    } else {
      var json = jsonDecode(serverResponse.body);
      var errorResponse = BaseErrorResponse.fromJson(json);
      throw errorResponse.message ??
          "Something went wrong please try again later";
    }
  }
}
