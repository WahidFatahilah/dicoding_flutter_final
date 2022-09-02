import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappnewversion/models/newsarticle.dart';
import 'package:newsappnewversion/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatefulWidget {
  NewsItem(this.newsArticle);
  final NewsArticle newsArticle;
  final bool expanded = false;

  @override
  createState() => NewsItemState(expanded);
}

class NewsItemState extends State<NewsItem>
    with SingleTickerProviderStateMixin {
  NewsItemState(this.expanded);
  bool expanded;

  void navigateToUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext build) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 20,
                spreadRadius: 3,
                offset: Offset(5, 5))
          ]),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // widget.newsArticle.urlToImage == null
                //     ? const AssetImage(
                //         Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
                //     : CachedNetworkImage(
                //         imageUrl: widget.newsArticle.urlToImage),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                Text(
                  widget.newsArticle.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    height: 0.8,
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 3)),
                expanded
                    ? Text(
                        widget.newsArticle.description,
                        style: TextStyle(fontSize: 20),
                      )
                    : Container(),
                Platform.isIOS
                    ? CupertinoButton.filled(
                        child: Text(
                          "Learn More",
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () => navigateToUrl(widget.newsArticle.url),
                        pressedOpacity: 0.6,
                      )
                    : MaterialButton(
                        onPressed: () => navigateToUrl(widget.newsArticle.url),
                        color: Color.fromRGBO(0, 150, 255, 1.0),
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8)),
                        animationDuration: Duration(milliseconds: 1000),
                        child: Text(
                          "Learn More",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                expanded
                    ? IconButton(
                        icon: Icon(Icons.keyboard_arrow_up),
                        onPressed: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
