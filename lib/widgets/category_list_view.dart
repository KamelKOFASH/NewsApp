import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_card.dart';

import '../models/category_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/technology.jpeg', catName: 'Business'),
    CategoryModel(image: 'assets/entertaiment.jpeg', catName: 'Entertainment'),
    CategoryModel(image: 'assets/health.jpeg', catName: 'Health'),
    CategoryModel(image: 'assets/science.jpeg', catName: 'Science'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: categories[index]);
        },
      ),
    );
  }
}
