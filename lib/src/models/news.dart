part 'article.dart';

class NewsModel {
  /* The format in which the api call is returned. */
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles:
          List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "totalResults": totalResults,
      "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
  }
}