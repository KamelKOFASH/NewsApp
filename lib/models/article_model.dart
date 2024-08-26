class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? publishedAt;
  final String? url;

  ArticleModel(
      {this.url,
      this.publishedAt,
      required this.image,
      required this.title,
      required this.subTitle});
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      url: json['url'],
      publishedAt: json['publishedAt'],
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
}
