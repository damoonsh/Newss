import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'news_model.dart';

// Url api to get the articles
final Uri url = Uri.parse(
    "https://newsapi.org/v2/top-headlines?country=us&pageSize=100&apiKey=84f2bbf63c7d4afe8419396d901fb246");

// Fetching articles
Future<NewsModel> fetchArticles() async {
  final http.Client client = http.Client();

  http.Response response = await client.get(url);

  return NewsModel.fromJson(jsonDecode(response.body));
}