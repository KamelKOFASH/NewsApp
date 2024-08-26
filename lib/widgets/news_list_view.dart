import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_card.dart';

import 'custom_circular_indicator.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.category});
  final String category;
  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  // ignore: prefer_typing_uninitialized_variables
  var _newsFuture;
  @override
  void initState() {
    super.initState();
    _newsFuture = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: _newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CustomCircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('Oops! there an error,try another time'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('No news available'),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(children: [
                  NewsCard(
                    articleModel: snapshot.data![index],
                  ),
                ]);
              },
              childCount: snapshot.data!.length,
            ),
          );
        }
      },
    );
  }
}
