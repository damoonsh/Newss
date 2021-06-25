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
  final double containerWidth = 150;

  Widget _imageHolder() {
    print(article.urlToImage);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            article.urlToImage,
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _articleIntro() {
    String desc;
    final int maxDescLen = 400;

    if (article.description.length > maxDescLen) {
      desc = article.description.substring(0, maxDescLen) + ' ...';
    } else {
      desc = article.description;
    }

    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 4, right: 3, top: 4),
            child: Column(children: <Widget>[
              Text(
                article.title,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                textScaleFactor: 0.8,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              
              Text(
                desc,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                textScaleFactor: 0.7,
                style: TextStyle(fontSize: 14),
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4, left: 2, right: 2, bottom:1),
      height: this.containerWidth,
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[this._imageHolder(), this._articleIntro()],
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
