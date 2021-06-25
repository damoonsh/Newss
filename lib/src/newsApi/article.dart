class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"],
      description: json["description"] == null ? "NO": json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"] == null ? "https://miro.medium.com/max/2420/1*Bq0iXRI3Ix2Oj8-pv-lD_g.jpeg" : json["urlToImage"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
    };
  }
}
