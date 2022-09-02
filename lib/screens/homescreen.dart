import 'package:get/get.dart';
import 'package:newsappnewversion/routes/name_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:newsappnewversion/widgets/customnewslist.dart';
import 'package:newsappnewversion/widgets/newsList.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Apps'), actions: const []),
      //drawer: const DrawerScreen(),
      body: ListView(
        children: <Widget>[
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            imageOverlay: const AssetImage("assets/images/cover.jpg"),
            title: const GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/image_headline.png'),
              ),
              titleText: 'Headline News',
              subTitleText: 'Trending News',
            ),
            content: const Text(
              "Read the Hot Topics and issues ",
              style: TextStyle(color: Colors.blue),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Get.toNamed(RouteName.pagenews_headline);
                  },
                  child: const Icon(
                    Icons.open_in_browser,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            imageOverlay: const AssetImage("assets/images/cover.jpg"),
            title: const GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage("assets/images/image_business.png"),
              ),
              titleText: 'Business News',
              subTitleText: 'Economis and Finance',
            ),
            content: const Text(
              "Read business news from around the world",
              style: TextStyle(color: Colors.blue),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Get.toNamed(RouteName.pagenews_business);
                  },
                  child: const Icon(
                    Icons.open_in_browser,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            imageOverlay: const AssetImage("assets/images/cover.jpg"),
            title: const GFListTile(
              avatar: GFAvatar(
                  backgroundImage:
                      AssetImage('assets/images/image_politics.png')),
              titleText: 'Politics News',
              subTitleText: 'Goverment & Law',
            ),
            content: const Text(
              "Read daily politcs news ",
              style: TextStyle(color: Colors.blue),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Get.toNamed(RouteName.pagenews_politics);
                  },
                  child: const Icon(
                    Icons.open_in_browser,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            imageOverlay: const AssetImage("assets/images/cover.jpg"),
            title: const GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/image_tech.png'),
              ),
              titleText: 'Tech News',
              subTitleText: 'Tech And New Innovation  ',
            ),
            content: const Text(
              "Read the te",
              style: TextStyle(color: Colors.blue),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Get.toNamed(RouteName.pagenews_tech);
                  },
                  child: const Icon(
                    Icons.open_in_browser,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice(
      {required this.keyword, required this.icon, required this.iOSIcon});

  final String keyword;
  final IconData icon;
  final IconData iOSIcon;
}

const List<Choice> choices = <Choice>[
  Choice(
      keyword: 'General',
      icon: Icons.library_books,
      iOSIcon: CupertinoIcons.news_solid),
  Choice(
      keyword: 'Business', icon: Icons.trending_up, iOSIcon: Icons.trending_up),
  Choice(
      keyword: 'Politics',
      icon: Icons.account_balance,
      iOSIcon: Icons.account_balance),
  Choice(keyword: 'Tech', icon: Icons.desktop_mac, iOSIcon: Icons.desktop_mac),
  Choice(keyword: 'Search', icon: Icons.search, iOSIcon: CupertinoIcons.search),
];

class CustomNewsList extends StatefulWidget {
  const CustomNewsList({Key? key}) : super(key: key);

  @override
  createState() =>
      // ignore: no_logic_in_create_state
      CustomNewsListState(imageURLs: [], keyword: '', texts: [], titles: []);
}

class HeadlineNews extends StatelessWidget {
  const HeadlineNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Headline News")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewsList(keyword: choices[0].keyword),
      ),
    );
  }
}

class BussinessNews extends StatelessWidget {
  const BussinessNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Business News")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewsList(keyword: choices[1].keyword),
      ),
    );
  }
}

class Politics extends StatelessWidget {
  const Politics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Politics News")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewsList(keyword: choices[2].keyword),
      ),
    );
  }
}

class TechNews extends StatelessWidget {
  const TechNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tech News")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewsList(keyword: choices[3].keyword),
      ),
    );
  }
}
