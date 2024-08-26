import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_list_view.dart';

// ignore: must_be_immutable
class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.category});
  final String category;
  // ignore: prefer_typing_uninitialized_variables
  var _newsFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(category)),
        body: FutureBuilder<List<ArticleModel>>(
          future: _newsFuture,
          builder: (context, snapshot) {
            return CustomScrollView(slivers: [
              NewsListView(
                category: category,
              ),
            ]);
          },
        ));
  }
}
