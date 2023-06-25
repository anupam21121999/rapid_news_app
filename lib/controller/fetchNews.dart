// https://newsapi.org/v2/top-headlines/sources?apiKey=fe45e3b530ac4268b73579f50dceac12
import 'dart:convert';
import 'dart:math';

import 'package:daily_news_app/models/newsArt.dart';
import 'package:http/http.dart';

class FetchNews{
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "entertainment-weekly",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",

  ];
  static Future<NewsArt> fetchNews() async{
    final random = new Random();
    var sourceID = sourcesId[random.nextInt(sourcesId.length)];
    print(sourceID);

    Response response = await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourcesId&apiKey=fe45e3b530ac4268b73579f50dceac12"));
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    print(articles);

    final newRandom = new Random();
    var myArticles = articles[newRandom.nextInt(articles.length)];
    print(myArticles);

    return NewsArt.fromApiToApp(myArticles);
  }
}