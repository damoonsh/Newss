import 'package:flutter/material.dart';

class SearchPad extends StatefulWidget {
  const SearchPad({Key? key}) : super(key: key);

  @override
  _SearchPadState createState() => _SearchPadState();
}

class _SearchPadState extends State<SearchPad> {
  TextEditingController _searchQueryController = TextEditingController();
  late String _valueBeingSearched;

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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 50, right: 50, top: 40),
        child: Row(children: [this._searchBar(), this._searchButton()]));
  }
}
