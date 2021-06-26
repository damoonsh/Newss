import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget articleTitle(String title) {
  int index = title.split('').reversed.join().indexOf('-');
  title = index != -1 ? title.substring(0, title.length - 2 - index): title;

  return Text(
    title,
    overflow: TextOverflow.clip,
    textAlign: TextAlign.left,
    textScaleFactor: 0.8,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget articleDescription(String description) {
  int maxDescLen = 200;
  TextStyle descriptionStyle = TextStyle(
    fontSize: 14, 
    // fontStyle: FontStyle.italic,
    // backgroundColor: Color.fromRGBO(100, 150, 120, 0.5),
    color: Color.fromRGBO(30, 20, 20, 0.7)
  );
  
  description = description.length > maxDescLen ? description.substring(0, maxDescLen) + ' ...' : description;

  return Text(
    description,
    overflow: TextOverflow.clip,
    textAlign: TextAlign.left,
    textScaleFactor: 0.7,
    style: GoogleFonts.lato(textStyle: descriptionStyle),
  );
}


  Widget articleIntro(String title, String description) {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 8),
          child: Column(children: <Widget>[
            articleTitle(title),
            SizedBox(
              height: 5,
            ),
            articleDescription(description),
          ])));
}
