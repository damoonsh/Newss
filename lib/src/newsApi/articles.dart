import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import './newsModel.dart';
import './article.dart';

import 'dart:async';

final Uri url = Uri.parse(
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=84f2bbf63c7d4afe8419396d901fb246");

Future<NewsModel> fetchArticles() async {
  final http.Client client = http.Client();

  http.Response response = await client.get(url);

  return NewsModel.fromJson(jsonDecode(response.body));
}

class ArticleHolder extends StatelessWidget {
  const ArticleHolder({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(24),
            // ),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              padding: new EdgeInsets.only(right: 13.0),
              child: Expanded(child: Text(article.title))),
        ],
      ),
    );
  }
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
