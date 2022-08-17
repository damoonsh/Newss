import 'package:api/src/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (contenxt) => FavoriteArticles(),
      child: MyApp()
    ),
  );
}
