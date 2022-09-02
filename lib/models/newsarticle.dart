// ignore: file_names
// ignore: file_names
import 'dart:convert';

import 'package:newsappnewversion/services/webservice.dart';
import 'package:newsappnewversion/utils/constants.dart';

class NewsArticle {
  NewsArticle(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage});

  final String title;
  final String description;
  final String url;
  final String urlToImage;

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'],
        //description: json['description'],
        description: json["description"].toString(),
        url: json['url'],
        urlToImage:
            json['urlToImage'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL);
  }

  chooseURL(keyword) {
    if (keyword == 'General') {
      return Constants.HEADLINE_NEWS_URL.substring(0, 37) +
          "country=us" +
          Constants.HEADLINE_NEWS_URL
              .substring(39, Constants.HEADLINE_NEWS_URL.length);
    } else if (keyword == 'Search') {
      // No idea!
    } else {
      return Constants.HEADLINE_NEWS_URL.substring(0, 39) +
          keyword.toLowerCase() +
          Constants.HEADLINE_NEWS_URL
              .substring(39, Constants.HEADLINE_NEWS_URL.length);
    }
  }

  Resource<List<NewsArticle>> all(key) {
    return Resource(
        url: chooseURL(key),
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        });
  }
}
