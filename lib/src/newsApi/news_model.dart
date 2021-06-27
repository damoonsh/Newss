class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String sourceName;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.sourceName,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"],
      description: json["description"] == null ? "NO" : json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"] == null
          ? "https://miro.medium.com/max/2420/1*Bq0iXRI3Ix2Oj8-pv-lD_g.jpeg"
          : json["urlToImage"],
      sourceName: json['source']['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      'sourceName': sourceName
    };
  }
}

class NewsModel {
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
