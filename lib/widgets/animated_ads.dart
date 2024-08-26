import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/constants/utils.dart';

import '../models/article_model.dart'; // You can use this package for carousels

class AnimatedAdsWidget extends StatefulWidget {
  List<ArticleModel> articles = [];
  final ArticleModel articleModel;

  AnimatedAdsWidget(
      {super.key, required this.articleModel, required this.articles});

  @override
  State<AnimatedAdsWidget> createState() => _AnimatedAdsWidgetState();
}

class _AnimatedAdsWidgetState extends State<AnimatedAdsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 150,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
        items: List.generate(
          widget.articles.length, // Number of ads
          (index) => Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                        widget.articles[index].image ?? Utils.defaultImage),
                    // Replace with your ads
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
