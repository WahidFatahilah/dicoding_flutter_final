// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappnewversion/models/newsarticle.dart';
import 'package:newsappnewversion/services/webservice.dart';

import 'NewsItem.dart';

class NewsList extends StatefulWidget {
  NewsList({required this.keyword});
  final String keyword;

  @override
  createState() =>
      NewsListState(keyword: keyword, imageURLs: [], texts: [], titles: []);
}

class NewsListState extends State<NewsList> {
  NewsListState(
      {required this.imageURLs,
      required this.titles,
      required this.texts,
      required this.keyword});
  final List<String> imageURLs;
  final List<String> titles;
  final List<String> texts;
  final String keyword;

  List<NewsArticle> _newsArticles = <NewsArticle>[];

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _populateNewsArticles() {
    WebService()
        .load(NewsArticle(description: '', urlToImage: '', url: '', title: '')
            .all(keyword))
        .then((newsArticles) => {
              setState(() {
                _newsArticles = newsArticles;
              })
            });
  }

  Widget _buildNewsItem(BuildContext build, index) {
    return NewsItem(_newsArticles[index]);
  }

  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          Padding(padding: const EdgeInsets.symmetric(vertical: 15)),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      itemBuilder: _buildNewsItem,
      itemCount: _newsArticles.length,
    );
  }
}
