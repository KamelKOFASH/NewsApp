import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../views/category_view.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryCard({super.key, required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  CategoryView(category: categoryModel.catName,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 100,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(categoryModel.image),
                fit: BoxFit.fill,
              )),
          child: Center(
            child: Text(
              categoryModel.catName,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
