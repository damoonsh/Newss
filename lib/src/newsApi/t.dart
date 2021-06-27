import 'package:flutter/material.dart';

class Mock extends StatelessWidget {
  const Mock({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(onTap: () {
              Navigator.pushNamed(context, '/');
            },child:Text("Something"))
    );
  }
}