// import 'package:api/src/newsApi/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_manager.dart';
// import 'article_holder.dart';
import 'articles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin  {
  
  TextEditingController _searchQueryController = TextEditingController();
  late String _valueBeingSearched;

  Widget _searchResults = Center(
    child: Text("Search Anything ..."),
  );

  bool _searched = false;

  Widget _searchBar() => Expanded(
          child: TextField(
        controller: _searchQueryController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.orange,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: TextInputType.multiline,
        keyboardAppearance: Brightness.light,
        showCursor: true,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(fontSize: 30),
        onChanged: (newQuery) {
          setState(() {
            this._valueBeingSearched = newQuery;
          });
        },
      ));

  Widget _searchButton() => ElevatedButton(
      onPressed: () {
        setState(() {
          this._searchResults = Scaffold(
              body:
                  Articles(articles: searchArticles(this._valueBeingSearched)));

          this._searched = true;
        });
      },
      child: Icon(
        Icons.arrow_forward_sharp,
        color: Colors.black26,
      ));

  Widget _searchPad() =>
      Row(children: [this._searchBar(), this._searchButton()]);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (this._searched) {
      return SafeArea(
          top: true,
          child: Padding(
              padding: EdgeInsets.only(top: 10), child: this._searchResults));
    } else {
      return Container(
          // padding: EdgeInsets.only(left: 50, right: 50, top: 40),
          child: Column(
        children: [this._searchPad(), this._searchResults],
      ));
    }
  }

  @override
  bool get wantKeepAlive => true;
}
