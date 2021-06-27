import 'package:flutter/material.dart';

PreferredSize appBar() =>
  PreferredSize(
    preferredSize: Size.fromHeight(20.0), 
    child: AppBar(
      elevation:0.2,
      backgroundColor: Colors.orange, 
      title: Text(
        'Newss', 
        style: TextStyle(
          fontStyle: FontStyle.italic, 
          fontWeight: FontWeight.w900
        ),
      ),
    )
  );   