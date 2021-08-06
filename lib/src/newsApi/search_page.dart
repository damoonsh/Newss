import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_manager.dart';
import 'articles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  TextEditingController _searchQueryController = TextEditingController();
  late String _valueBeingSearched;

  Widget _searchResults = Center(
    child: Text("Search Anything ..."),
  );

  bool _searched = false;

  Widget _searchBar() => 
  Expanded(flex: 3,
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
        )
  );

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
  String _dropdownValue = 'Default';
  Widget _categoryButton() => DropdownButton<String>(
        value: _dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 15,
        elevation: 3,
        style: const TextStyle(color: Colors.deepOrange),
        onChanged: (String? newValue) {
          setState(() {
            _dropdownValue = newValue!;
          });
        },
        items: <String>['Technology', 'History', 'Politics', 'Default']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

  Widget _searchPad() =>
      Row(children: [this._searchBar(), this._categoryButton(), this._searchButton()]);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(children: <Widget>[
      this._searchPad(),
      Expanded(child: this._searchResults)
    ]);

    // if (this._searched) {
    //   return Column(children: <Widget>[this._searchPad(),
    //     Expanded(child: this._searchResults)]);
    // } else {
    //   return Container(
    //       // padding: EdgeInsets.only(left: 50, right: 50, top: 40),
    //       child: Column(
    //     children: [this._searchPad(), this._searchResults],
    //   ));
    // }
  }

  @override
  bool get wantKeepAlive => true;
}
