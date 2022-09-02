import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappnewversion/models/newsarticle.dart';
import 'package:newsappnewversion/screens/homescreen.dart';
import 'package:newsappnewversion/services/webservice.dart';
import 'package:newsappnewversion/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'NewsItem.dart';

class CustomNewsListState extends State<CustomNewsList> {
  CustomNewsListState(
      {required this.imageURLs,
      required this.titles,
      required this.texts,
      required this.keyword});
  final List<String> imageURLs;
  final List<String> titles;
  final List<String> texts;
  final TextEditingController _textController = new TextEditingController();
  bool queryTried = false;
  String keyword;

  List<NewsArticle> _newsArticles = <NewsArticle>[];

  @override
  void initState() {
    super.initState();
    if (keyword != null) {
      _populateNewsArticles();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _populateNewsArticles() {
    WebService()
        .load(NewsArticle(description: '', title: '', url: '', urlToImage: '')
            .all(keyword))
        .then((newsArticles) => {
              setState(() {
                _newsArticles = newsArticles;
                queryTried = true;
              })
            });
  }

  void navigateToUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      keyword = text;
      _populateNewsArticles();
    });
  }

  Widget _buildNewsItem(BuildContext build, index) {
    return NewsItem(_newsArticles[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  hintText: "Insert the keyword to search..."),
            ),
          ),
          Container(
            child: IconButton(
              color: Colors.blueAccent,
              onPressed: () => _handleSubmitted(_textController.text),
              icon: Icon(Icons.send),
            ),
          )
        ]),
        Divider(
          height: 25,
          color: Colors.black87,
        ),
        Flexible(
          child: _newsArticles.length > 0
              ? ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  itemBuilder: _buildNewsItem,
                  itemCount: _newsArticles.length,
                )
              : Container(
                  child: queryTried
                      ? Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Sorry, we could not find any news matching your search.",
                            style: TextStyle(
                                fontSize: 25, color: Colors.grey[400]),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search,
                            color: Colors.grey[300],
                            size: 200,
                          )),
                ),
        )
      ]),
    );
  }
}
