part of 'news.dart';

class Article {
  /* Object containing information about one Article. */
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String sourceName;
  final String content;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.sourceName,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json["title"],
        description: json["description"] == null ? "" : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null
            ? "https://miro.medium.com/max/2420/1*Bq0iXRI3Ix2Oj8-pv-lD_g.jpeg"
            : json["urlToImage"],
        sourceName: json['source']['name'],
        content: json['content'] == null ? "Null": json['content']);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      'sourceName': sourceName,
      "content": content
    };
  }
}
