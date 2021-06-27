import 'package:flutter/material.dart';

import 'src/newsApi/articles.dart';
import 'src/newsApi/t.dart';
import 'src/search/search_page.dart';
import 'modules/app_bar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'api',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Articles(), Mock(), SearchBar()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _navList() => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ];

  BottomNavigationBar _bottomNavbar() => BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 20,
      backgroundColor: Colors.orange,
      elevation: 1,
      items: this._navList(),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent[500],
      onTap: _onItemTapped);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: this._bottomNavbar(),
      body: this._pages[this._selectedIndex],
    );
  }
}
