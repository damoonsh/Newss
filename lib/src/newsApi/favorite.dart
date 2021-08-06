import 'package:flutter/material.dart';
import './news_model.dart';
import 'article_holder.dart';
import 'package:provider/provider.dart';

List<Article> mockArticles = [
  Article(
      title:
          "Widespread electrification requires us to rethink battery technology",
      description:
          "The global transition to electrification has increased demand for longer-lasting and faster-charging batteries. But battery innovation hasn’t kept pace with society’s ambitions.",
      url:
          "http://techcrunch.com/2021/06/10/widespread-electrification-requires-us-to-rethink-battery-technology/",
      urlToImage:
          "https://techcrunch.com/wp-content/uploads/2021/06/GettyImages-954558336.jpg?w=599",
      sourceName: "TechCrunch"),
  Article(
      title: "Google's speedier internet standard is now an actual standard",
      description:
          "Google's QUIC data technology is now an official internet standard, potentially improving connections worldwide..",
      url:
          "https://www.engadget.com/google-quic-becomes-official-internet-standard-170000970.html",
      urlToImage:
          "https://s.yimg.com/os/creatr-uploaded-images/2021-05/fd12e750-c20d-11eb-85ef-c8d4cf2a6a9b",
      sourceName: "Engadget")
];

class FavoriteArticles extends ChangeNotifier {
  List<Article> _articles = mockArticles;

  List<Article> get items => _articles;

  void add(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void remove(Article article) {
    _articles.remove(article);
    notifyListeners();
  }
}


class Mock extends StatelessWidget {
  const Mock({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {  
    var favArticles = context.watch<FavoriteArticles>().items;

    return Container(
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: ListView.builder(
              itemCount: favArticles.length,
              itemBuilder: (context, index) {
                var article = favArticles[index];
                return ArticleHolder(article: article, isFavorite: true,);
              },
            )));
  }
}
