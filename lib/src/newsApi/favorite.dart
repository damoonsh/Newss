import 'package:flutter/material.dart';
import './news_model.dart';
import 'article_holder.dart';
// class FavoriteArticles extends ChangeNotifier {
//   late List _favorite_articles;

//   void remove() {

//   }
// }

class Mock extends StatelessWidget {
  const Mock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: ListView.builder(
              itemCount: mock_articles.length,
              itemBuilder: (context, index) {
                var article = mock_articles[index];
                return ArticleHolder(article: article);
              },
            )));
  }
}
