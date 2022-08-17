import 'package:api/src/screens/article_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/models.dart';

class ArticleHolder extends StatelessWidget {
  const ArticleHolder(
      {Key? key, required this.article, required this.isFavorite})
      : super(key: key);

  final Article article;
  final bool isFavorite;
  final double containerHeight = 200;
  final double containerWidth = 300;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
      MaterialPageRoute(builder: (context) => ArticlePage(article: this.article)));
      },
      child: Container(
          margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
          color: Colors.grey,
          height: containerHeight,
          width: containerWidth,
          child: Row(
            children: <Widget>[this._imageHolder(), this._articleIntro()],
          )),
    );
  }

  Widget _imageHolder() => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              article.urlToImage,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : CupertinoActivityIndicator(animating: true, radius: 5);
              },
            )),
      );

  Widget _articleIntro() {
    int index = article.title.split('').reversed.join().indexOf('-');
    String trimedTitle = index != -1
        ? article.title.substring(0, article.title.length - 2 - index)
        : article.title;

    Widget article_title = Expanded(
        child: Text(trimedTitle, style: new TextStyle(fontSize: 16)));

    Widget article_source =
        Positioned(child: Text(article.sourceName), bottom: 10, right: 10);

    return Container(
        padding: EdgeInsets.all(10),
        width: this.containerWidth,
        height: this.containerHeight,
        child: Stack(children: <Widget>[article_title, article_source]));
  }
}
