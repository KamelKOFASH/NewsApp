import 'package:flutter/material.dart';
import 'package:news_app/widgets/app_bar_widget.dart';
import 'package:news_app/widgets/category_list_view.dart';
import 'package:news_app/widgets/news_list_view.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            // AnimatedAdsWidget(),
            NewsListView(
              category: '1',
            ),
          ],
        ),
      ),
    );
  }
}
