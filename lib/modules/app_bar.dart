import 'package:flutter/material.dart';

Widget appBarTitle() => Text(
      'Newss',
      style: TextStyle(
          // fontSize: 40,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900),
    );

PreferredSize appBar() =>
  PreferredSize(
    preferredSize: Size.fromHeight(30.0),
    child: AppBar(
      // actions: [IconButton(icon: Icon(Icons.search), onPressed: () {},)],
      elevation:0.5,
      backgroundColor: Colors.orange,
      title: appBarTitle()
    )
  );