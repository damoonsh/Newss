import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchQueryController = TextEditingController();
  late String _valueBeingSearched;

  bool _showSearch = false;

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
      onPressed: () {},
      child: Icon(
        Icons.arrow_forward_sharp,
        color: Colors.black26,
      ));

  Widget _searchPad() => Row(children: [this._searchBar(), this._searchButton()]);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 50, right: 50, top: 40),
        child: Column(children: [this._searchPad(), 
        // this._showSearch ? Container(): Container(
          ],)
    );
  }
}
