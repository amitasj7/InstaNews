import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp2/helper/models/article_model.dart';

/* 
class News {
  List<Article> _news = [];

  Future<List<Article>> getNews(String? category) async {
    var apikey = "b78dda771d844c4d9d76cd2c65e6c5a4";

    var _url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&language=en&apiKey=${apikey}");

    var _url2 = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&language=en&apiKey=${apikey}");

    var response = await http.get(category == null ? _url : _url2);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article _article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAT: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          _news.add(_article);
        }
      });
    }
    return _news;
  }
}
 */

class News {
  List<Article> _news = [];

  Future<List<Article>> getNews() async {
    var apikey = "b78dda771d844c4d9d76cd2c65e6c5a4";

    var _url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&language=en&apiKey=${apikey}");

    var response = await http.get(_url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article _article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAT: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          _news.add(_article);
        }
      });
    }
    return _news;
  }
}

class NewsForCategorie {
  List<Article> _news = [];

  Future<List<Article>> getNewsForCategorie(String category) async {
    var apikey = "b78dda771d844c4d9d76cd2c65e6c5a4";

    var _url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&language=en&apiKey=${apikey}");

    var response = await http.get(_url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article _article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAT: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          _news.add(_article);
        }
      });
    }
    return _news;
  }
}
