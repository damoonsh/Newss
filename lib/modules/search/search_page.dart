import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchQueryController = TextEditingController();
  late String _valueBeingSearched;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 50, right: 50, top: 20),
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
  }
}
