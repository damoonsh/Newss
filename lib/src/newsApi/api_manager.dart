import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'news_model.dart';

// Some constants

final String api_key = "84f2bbf63c7d4afe8419396d901fb246";
final String base_url = "https://newsapi.org/v2";

// defualt Url api to get the articles
final Uri topHeadlineUrl = Uri.parse(
    "$base_url/top-headlines?country=us&pageSize=100&apiKey=$api_key");

// Client module for making api calls
final http.Client client = http.Client();

Future<NewsModel> searchArticles(String keyword, [String category = ""]) async {
  Uri searchUrl = Uri.parse(category == ""
      ? "$base_url/everything?q=$keyword"
      : "$base_url/everything?q=$keyword&category=$category");

  print(keyword);

  http.Response response = await client.get(searchUrl);

  return NewsModel.fromJson(jsonDecode(response.body));
}

// Fetching articles
Future<NewsModel> fetchArticles() async {
  http.Response response = await client.get(topHeadlineUrl);

  return NewsModel.fromJson(jsonDecode(response.body));
}
