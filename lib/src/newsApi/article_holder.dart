import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'article_info.dart';
import 'article_image.dart';

import 'news_model.dart';

class ArticleHolder extends StatelessWidget {
  const ArticleHolder({Key? key, required this.article}) : super(key: key);

  final Article article;
  final double containerHeight = 170;

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

  Widget _articleHandler() {
    return GestureDetector(
      onLongPress: _launchURL,
      // onDoubleTap: ,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              imageHolder(article.urlToImage),
              articleIntro(
                  article.title, article.description, article.sourceName)
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(top: 1),
        margin: EdgeInsets.all(5),
        height: this.containerHeight,
        // color: Color.fromRGBO(5, 2, 4, 0.5),
        child: this._articleHandler());
  }
}
