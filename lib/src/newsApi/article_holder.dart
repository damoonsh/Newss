import 'package:api/src/newsApi/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'news_model.dart';

class ArticleHolder extends StatelessWidget {
  const ArticleHolder(
      {Key? key, required this.article, required this.isFavorite})
      : super(key: key);

  final Article article;
  final bool isFavorite;
  final double containerHeight = 150;

  // final TextStyle _descriptionStyle = const TextStyle(
  //     fontSize: 14, color: const Color.fromRGBO(30, 20, 20, 0.7));

  final TextStyle _titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

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
                // LinearProgressIndicator();
              },
            )),
      );

  Widget _articleTitle() {
    int index = article.title.split('').reversed.join().indexOf('-');
    String trimedTitle = index != -1
        ? article.title.substring(0, article.title.length - 2 - index)
        : article.title;

    return Text(
      trimedTitle,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.left,
      textScaleFactor: 0.6,
      style: this._titleStyle,
    );
  }

  // Widget _articleDescription() => Expanded(
  //       child: Text(
  //     article.description,
  //     overflow: TextOverflow.clip,
  //     textAlign: TextAlign.left,
  //     textScaleFactor: 0.7,
  //     style: GoogleFonts.lato(textStyle: this._descriptionStyle),
  //   ));

  Widget _articleSourceName() => Text(
        article.sourceName,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.left,
        textScaleFactor: 0.7,
        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 12)),
      );

  Widget _articleIntro() => Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 5, right: 10, top: 3),
          child: Container(
              color: Colors.grey[100],
              child: Column(children: <Widget>[
                this._articleTitle(),
                this._articleSourceName(),
                SizedBox(
                  height: 5,
                ),
                // this._articleDescription(),
              ]))));

  void _launchURL() {
    FlutterWebBrowser.openWebPage(
      url: article.url,
      customTabsOptions: CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        toolbarColor: Colors.deepPurple,
        secondaryToolbarColor: Colors.green,
        navigationBarColor: Colors.amber,
        addDefaultShareMenuItem: true,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.green,
        preferredControlTintColor: Colors.amber,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }

  Widget _articleHandler(BuildContext context) {
    bool favAlready = context.select<FavoriteArticles, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (articles) => articles.items.contains(article),
    );

    var _articleColor = !isFavorite & favAlready ? Colors.blue : Colors.grey[100];

    return GestureDetector(
      onTap: _launchURL,
      onDoubleTap: () {
        favAlready
            ? context.read<FavoriteArticles>().remove(article)
            : context.read<FavoriteArticles>().add(article);
      },
      child: Container(
          decoration: BoxDecoration(
              color: _articleColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[this._imageHolder(), this._articleIntro()],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 3),
        margin: EdgeInsets.all(5),
        height: this.containerHeight,
        // color: Color.fromRGBO(5, 2, 4, 0.5),
        child: this._articleHandler(context));
  }
}
