import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/everything?q=$category&apiKey=9f761a85432a4a19a0946b2c88bb0766&language=ar&sortBy=publishedAt");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel art = ArticleModel.fromJson(article);
        articleList.add(art);
      }
      return articleList;
    } catch (e) {
      SnackBar(content: Text(e.toString()));
      return [];
    }
  }
}
