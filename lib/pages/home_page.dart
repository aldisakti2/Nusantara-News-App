import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_state.dart';
import 'package:nusantara_news_app/models/web_articles.dart';
import 'package:nusantara_news_app/pages/kementerian/dikbud_page.dart';
import 'package:nusantara_news_app/pages/kementerian/kesehatan_page.dart';
//import 'package:nusantara_news_app/pages/kementerian/keuangan_page.dart';
import 'package:nusantara_news_app/pages/kementerian/naker_page.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Web_Article>> futureArticles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: kBgColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 35,
                  right: 30,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat datang di',
                              style: kBody1.copyWith(
                                color: kMatterhornBlack,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'Nusantara News ',
                              style: kHeading6.copyWith(
                                color: kBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Info Kementerian RI',
                            style: kHeading6.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: kPeacoat,
                            )),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: _infoLayanan(
                              'assets/images/kemenaker-logo.png', 'Kemenaker',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KemenakerPage()),
                            );
                          }),
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: _infoLayanan(
                              'assets/images/kemendikbud-logo.png',
                              'Kemendikbud', () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KemendikbudPage()),
                            );
                          }),
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: _infoLayanan(
                              'assets/images/kemenkes-logo.png', 'Kemenkes',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KemenkesPage()),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Berita Terbaru',
                            style: kHeading6.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: kPeacoat,
                            )),
                      ],
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 150,
                      child: FutureBuilder<List<Web_Article>>(
                        future: fetchLatestNews(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: kBlueRibbon,
                            ));
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No articles found.'));
                          } else {
                            List<Web_Article> articles = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                Web_Article article = articles[index];
                                return _berita(
                                  _cardBeritaTerbaru(
                                    Colors.blue,
                                    Colors.blue.shade300,
                                    truncateText(article.title, 4, " ..."),
                                    article.category,
                                    article.date,
                                    article
                                        .date, // Update with actual view count if available
                                  ),
                                  () {
                                    String selectedUrl;
                                    String filtering;

                                    if (article.category == 'Kemendikbud') {
                                      selectedUrl = article.link;
                                      filtering =
                                          "if (a[i].classList.contains('navbar'))";
                                    } else if (article.category == 'Kemenkes') {
                                      selectedUrl = 'https://www.kemkes.go.id' +
                                          article.link;
                                      filtering =
                                          "if (a[i].classList.contains('header-bottom') || a[i].classList.contains('col-md-6') || a[i].classList.contains('col-md-4') || a[i].localName.includes('footer'))";
                                    } else if (article.category ==
                                        'Kemenaker') {
                                      selectedUrl = 'https://kemnaker.go.id' +
                                          article.link;
                                      filtering =
                                          "if (a[i].classList.contains('news-comment') || a[i].classList.contains('news-related') || a[i].localName.includes('navbar') || a[i].localName.includes('footer'))";
                                    } else {
                                      selectedUrl = article.link;
                                      filtering = "";
                                    }

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WebViewPage(
                                          title: article.title,
                                          selectedUrl: selectedUrl,
                                          filtering: filtering,
                                          category: article.category,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Update Info Pemerintah',
                            style: kHeading6.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: kPeacoat,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ArticleListWidget(
                      futureArticles: fetchData(
                          'https://kemnaker.go.id/news/latest/all',
                          'div h5',
                          'div.news-date',
                          'a[href ^= "/news/detail"]',
                          'Kemenaker'),
                      filterTag:
                          "if (a[i].classList.contains('news-comment') || a[i].classList.contains('news-related') || a[i].localName.includes('navbar') || a[i].localName.includes('footer'))",
                      optionalWeb: "https://kemnaker.go.id",
                    ),
                    ArticleListWidget(
                      futureArticles: fetchData(
                          'https://www.kemdikbud.go.id/main/blog',
                          'strong a',
                          'small span',
                          'strong a',
                          'Kemendikbud'),
                      filterTag: "if (a[i].classList.contains('navbar'))",
                      optionalWeb: "",
                    ),
                    ArticleListWidget(
                      futureArticles: fetchData(
                          'https://www.kemkes.go.id/id/category/artikel-kesehatan',
                          'div h4',
                          'time em',
                          'a.link',
                          'Kemenkes'),
                      filterTag:
                          "if (a[i].classList.contains('header-bottom') || a[i].classList.contains('col-md-6') || a[i].classList.contains('col-md-4') || a[i].localName.includes('footer'))",
                      optionalWeb: "https://www.kemkes.go.id",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoLayanan(String img, String text, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: 72.41,
              width: 72.41,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 4.5,
          ),
          Center(
            child: Text(
              text,
              style: kCaption.copyWith(
                color: kBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _berita(Widget card, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: card,
    );
  }

  Widget _cardBeritaTerbaru(Color color1, Color color2, String title,
      String ministry, String date, String view) {
    return Card(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color1, //Colors.blue,
        ),
        child: Row(
          children: [
            Container(
              width: 72,
              height: 99,
              margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: color2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    truncateWords(date, 0, 1),
                    style: kHeading5.copyWith(
                        color: kWhite, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ministry,
                    style: kSubtitlemid2.copyWith(
                        color: kWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    title,
                    style: kHeading6.copyWith(color: kWhite),
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/eye.png",
                        height: 16,
                        fit: BoxFit.cover,
                        color: kWhite.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        view,
                        style: kNumber.copyWith(color: kWhite.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String truncateText(String title, int max, String addition) {
    List<String> words = title.split(' ');
    if (words.length > 4) {
      return '${words.sublist(0, max).join(' ')}${addition}';
    } else {
      return title;
    }
  }
}
