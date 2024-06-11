import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:html/parser.dart' as htmlParser;
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/pages/kementerian/dikbud_page.dart';
import 'package:nusantara_news_app/pages/kementerian/kesehatan_page.dart';
import 'package:nusantara_news_app/pages/kementerian/keuangan_page.dart';
import 'package:nusantara_news_app/pages/kementerian/naker_page.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class Article {
  final String title;
  final String date;

  Article({required this.title, required this.date});
}

Future<List<Article>> fetchArticles(
    String url, String titleSelector, String dateSelector) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var document = html.parse(response.body);

    var titles = document.querySelectorAll(titleSelector);
    var dates = document.querySelectorAll(dateSelector);

    List<Article> articles = [];

    for (int i = 0; i < titles.length; i++) {
      String title = titles[i].text.trim();
      String date = dates[i].text.trim();
      articles.add(Article(title: title, date: date));
    }

    return articles;
  } else {
    throw Exception('Failed to load articles');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles(
        'https://www.kemdikbud.go.id/main/blog', // Replace with the actual URL
        'strong a', // Replace with the actual title selector
        'small' // Replace with the actual date selector
        );
  }

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
                              'assets/images/kemenkeu-logo.png', 'Kemenkeu',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KemenkeuPage()),
                            );
                          }),
                        ),
                        SizedBox(width: 4),
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
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Card(
                                child: Container(
                                  width: 290,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.blue,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 72,
                                        height: 99,
                                        margin:
                                            EdgeInsets.fromLTRB(14, 10, 14, 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.blue[300],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '20',
                                              style: kHeading5.copyWith(
                                                  color: kWhite,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'april',
                                              style: kHeading5.copyWith(
                                                color: kWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Proses pembagian bansos',
                                              style: kSubtitlemid2.copyWith(
                                                  color: kWhite,
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            SizedBox(height: 2.0),
                                            Text(
                                              'Bansos Happy',
                                              style: kHeading6.copyWith(
                                                  color: kWhite),
                                            ),
                                            SizedBox(height: 3.0),
                                            Text(
                                              'untuk 700 kepala keluarga',
                                              style: kCaption.copyWith(
                                                  color:
                                                      kWhite.withOpacity(0.65)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                  child: Container(
                                      width: 290,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        color: Colors.yellow[100],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 72,
                                            height: 99,
                                            margin: EdgeInsets.fromLTRB(
                                                14, 10, 14, 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              color: Colors.yellow[700],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '20',
                                                  style: kHeading5.copyWith(
                                                      color: kWhite,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'april',
                                                  style: kHeading5.copyWith(
                                                    color: kWhite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Proses pembagian bansos',
                                                  style: kSubtitlemid2.copyWith(
                                                      color: Colors.yellow[700],
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                SizedBox(height: 2.0),
                                                Text(
                                                  'Bansos Happy',
                                                  style: kHeading6.copyWith(
                                                      color:
                                                          Colors.yellow[700]),
                                                ),
                                                SizedBox(height: 3.0),
                                                Text(
                                                  'untuk 700 kepala keluarga',
                                                  style: kCaption.copyWith(
                                                      color: Color.fromARGB(
                                                              255, 255, 175, 71)
                                                          .withOpacity(0.7)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                            ])),
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
                      futureArticles: _fetchData(
                          'https://www.kemdikbud.go.id/main/blog',
                          'strong a',
                          'small span'),
                      titleSelector: 'strong a',
                      dateSelector: 'small span',
                      kementerian_category:
                          'Kementerian Pendidikan dan Kebudayaan',
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

  Widget _UpdateInfoPemerintah(String title, String view) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kSubtitlemid3,
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/eye.png",
              height: 16,
              fit: BoxFit.cover,
              color: Color(0xFF98A0A2),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              view,
              style: kNumber.copyWith(color: Color(0xFF98A0A2)),
            ),
          ],
        ),
      ],
    );
  }

  Future<List<Article>> _fetchData(
      String url, String titleSelector, String dateSelector) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final htmlDocument = htmlParser.parse(response.body);
        final titleElements = htmlDocument.querySelectorAll(titleSelector);
        final dateElements = htmlDocument.querySelectorAll(dateSelector);

        List<Article> articles = [];
        for (int i = 0; i < titleElements.length; i++) {
          String title = titleElements[i].text;
          String date = dateElements.length > i ? dateElements[i].text : '';
          articles.add(Article(title: title, date: date));
        }

        return articles;
      } else {
        throw Exception('Failed to load page');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
