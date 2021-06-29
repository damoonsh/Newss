import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_model.dart';
import 'article_holder.dart';
import 'api_manager.dart';

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
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
            semanticsLabel: 'loading',
            strokeWidth: 10,
          ));
          // return CupertinoActivityIndicator(radius: 50, animating: true,);
        });
  }
}
