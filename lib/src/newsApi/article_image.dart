import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageHolder(String urlToImage) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          urlToImage,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            return progress == null
                ? child
                : CupertinoActivityIndicator(animating: true, radius: 35);
            // LinearProgressIndicator();
          },
        )),
  );
}
