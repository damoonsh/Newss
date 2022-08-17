import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/models.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.sourceName)
      ),
      body: Center(child: Column(
        children: [
          Text(article.title),
          Text(article.content),
        ],
      )),
    );
  }
}
