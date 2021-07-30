class Article {
  /* Object containing information about one Article. */
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
        description: json["description"] == null ? "" : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null
            ? "https://miro.medium.com/max/2420/1*Bq0iXRI3Ix2Oj8-pv-lD_g.jpeg"
            : json["urlToImage"],
        sourceName: json['source']['name']);
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

final List<Article> mock_articles = [
  Article(
      title:
          "Widespread electrification requires us to rethink battery technology",
      description:
          "The global transition to electrification has increased demand for longer-lasting and faster-charging batteries. But battery innovation hasn’t kept pace with society’s ambitions.",
      url:
          "http://techcrunch.com/2021/06/10/widespread-electrification-requires-us-to-rethink-battery-technology/",
      urlToImage:
          "https://techcrunch.com/wp-content/uploads/2021/06/GettyImages-954558336.jpg?w=599",
      sourceName: "TechCrunch"),
  Article(
      title: "Google's speedier internet standard is now an actual standard",
      description:
          "Google's QUIC data technology is now an official internet standard, potentially improving connections worldwide..",
      url:
          "https://www.engadget.com/google-quic-becomes-official-internet-standard-170000970.html",
      urlToImage:
          "https://s.yimg.com/os/creatr-uploaded-images/2021-05/fd12e750-c20d-11eb-85ef-c8d4cf2a6a9b",
      sourceName: "Engadget")
];

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
