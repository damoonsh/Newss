import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_model.dart';
import 'article_holder.dart';

class Articles extends StatelessWidget {
  const Articles({Key? key, required this.articles}) : super(key: key);

  final Future<NewsModel> articles;

  Widget _loadingCircle() => Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.orange,
        semanticsLabel: 'loading',
        strokeWidth: 10,
      ));

  Widget _articlesLoader() => FutureBuilder<NewsModel>(
      future: articles,
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
          print("ERR: $snapshot.error");
        }
        return this._loadingCircle();
        // return CupertinoActivityIndicator(radius: 50, animating: true,);
      });

  @override
  Widget build(BuildContext context) {
    return this._articlesLoader();
  }
}
