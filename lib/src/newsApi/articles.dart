import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import './newsModel.dart';
import './articleHolder.dart';

// Url api to get the articles
final Uri url = Uri.parse(
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=84f2bbf63c7d4afe8419396d901fb246");

// Fetching articles
Future<NewsModel> fetchArticles() async {
  final http.Client client = http.Client();

  http.Response response = await client.get(url);

  return NewsModel.fromJson(jsonDecode(response.body));
}


class Articles extends StatefulWidget {
  Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
        future: fetchArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data!.articles[index];
                return ArticleHolder(article: article);
              },
            );
          } else {
            print(snapshot.error);
          }

          return CircularProgressIndicator();
        });
  }
}
