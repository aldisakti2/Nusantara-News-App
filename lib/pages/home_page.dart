import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:html/parser.dart' as htmlParser;
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_state.dart';
import 'package:nusantara_news_app/pages/kementerian/dikbud_page.dart';
import 'package:nusantara_news_app/pages/kementerian/kesehatan_page.dart';
import 'package:nusantara_news_app/pages/kementerian/keuangan_page.dart';
import 'package:nusantara_news_app/pages/kementerian/naker_page.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class Article {
  final String title;
  final String date;
  final String link;

  Article({required this.title, required this.date, required this.link});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> futureArticles;

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
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _berita(
                                  _cardBeritaTerbaru(
                                      Colors.blue,
                                      Colors.blue.shade300,
                                      'Pelayaran Muhibah Budaya ...',
                                      'Kementerian Pendidikan dan Kebudayaan RI',
                                      '11 Juni'), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewPage(
                                          title: 'Kemendikbud',
                                          selectedUrl:
                                              'https://www.kemdikbud.go.id/main/blog/2024/06/pelayaran-muhibah-budaya-jalur-rempah-2024-singgah-di-belitung-timur',
                                          filtering:
                                              "if (a[i].classList.contains('navbar'))")),
                                );
                              }),
                              _berita(
                                  _cardBeritaTerbaru(
                                      Colors.green,
                                      Colors.green.shade300,
                                      'Makna Program ADEM Bagi Generasi ...',
                                      'Kementerian Pendidikan dan Kebudayaan RI',
                                      '11 Juni'), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewPage(
                                          title: 'Kemendikbud',
                                          selectedUrl:
                                              'https://www.kemdikbud.go.id/main/blog/2024/06/makna-program-adem-bagi-generasi-muda-yang-berasal-dari-wilayah-pelosok',
                                          filtering:
                                              "if (a[i].classList.contains('navbar'))")),
                                );
                              }),
                              _berita(
                                  _cardBeritaTerbaru(
                                      Colors.orange,
                                      Colors.orange.shade300,
                                      'Kemendikbudristek dan Universitas Al-Azhar ...',
                                      'Kementerian Pendidikan dan Kebudayaan RI',
                                      '11 Juni'), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewPage(
                                          title: 'Kemendikbud',
                                          selectedUrl:
                                              'https://www.kemdikbud.go.id/main/blog/2024/06/kemendikbudristek-dan-universitas-alazhar-kairo-perluas-jalinan-kerja-sama-bidang-kesehatan',
                                          filtering:
                                              "if (a[i].classList.contains('navbar'))")),
                                );
                              }),
                              _berita(
                                  _cardBeritaTerbaru(
                                      Colors.red,
                                      Colors.red.shade300,
                                      'Berbudaya Asyik, Bermain Angklung di ...',
                                      'Kementerian Pendidikan dan Kebudayaan RI',
                                      '11 Juni'), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewPage(
                                          title: 'Kemendikbud',
                                          selectedUrl:
                                              'https://www.kemdikbud.go.id/main/blog/2024/06/berbudaya-asyik-bermain-angklung-di-global-gathering-dan-festival-indonesia-week',
                                          filtering:
                                              "if (a[i].classList.contains('navbar'))")),
                                );
                              }),
                              _berita(
                                  _cardBeritaTerbaru(
                                      Colors.purple,
                                      Colors.purple.shade300,
                                      'Program Magang Budaya Jadi Sarana ...',
                                      'Kementerian Pendidikan dan Kebudayaan RI',
                                      '11 Juni'), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewPage(
                                          title: 'Kemendikbud',
                                          selectedUrl:
                                              'https://www.kemdikbud.go.id/main/blog/2024/06/program-magang-budaya-jadi-sarana-tumbuhkan-kecintaan-akan-indonesia-di-korea-selatan',
                                          filtering:
                                              "if (a[i].classList.contains('navbar'))")),
                                );
                              }),
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
                          'https://kemnaker.go.id/news/latest/all',
                          'div h5',
                          'div.news-date',
                          'a[href ^= "/news/detail"]'),
                      filterTag:
                          "if (a[i].classList.contains('news-comment') || a[i].classList.contains('news-related') || a[i].localName.includes('navbar') || a[i].localName.includes('footer'))",
                      OptionalWeb: "https://kemnaker.go.id",
                    ),
                    ArticleListWidget(
                      futureArticles: _fetchData(
                          'https://www.kemdikbud.go.id/main/blog',
                          'strong a',
                          'small span',
                          'strong a'),
                      filterTag: "if (a[i].classList.contains('navbar'))",
                      OptionalWeb: "",
                    ),
                    ArticleListWidget(
                      futureArticles: _fetchData(
                          'https://www.kemkes.go.id/id/category/artikel-kesehatan',
                          'div h4',
                          'time em',
                          'a.link'),
                      filterTag:
                          "if (a[i].classList.contains('header-bottom') || a[i].classList.contains('col-md-6') || a[i].classList.contains('col-md-4') || a[i].localName.includes('footer'))",
                      OptionalWeb: "https://www.kemkes.go.id",
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

  Widget _cardBeritaTerbaru(
      Color color1, Color color2, String title, String ministry, String date) {
    return Card(
      child: Container(
        width: 500,
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
                    date,
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
                  Text(
                    date + ' 2024',
                    style: kCaption.copyWith(color: kWhite.withOpacity(0.65)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length > 4) {
      return '${words.sublist(0, 5).join(' ')} ...';
    } else {
      return title;
    }
  }
}

Future<List<Article>> _fetchData(
  String url,
  String titleSelector,
  String dateSelector,
  String linkSelector,
) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final htmlDocument = htmlParser.parse(response.body);
      final titleElements = htmlDocument.querySelectorAll(titleSelector);
      final dateElements = htmlDocument.querySelectorAll(dateSelector);
      final linkElements = htmlDocument.querySelectorAll(linkSelector);

      List<Article> articles = [];

      for (int i = 0; i < titleElements.length; i++) {
        final title = titleElements[i].text.trim();
        final date = dateElements.isNotEmpty && i < dateElements.length
            ? dateElements[i].text.trim()
            : 'No date found';
        final link = linkElements[i].attributes['href'] ?? '';

        articles.add(Article(title: title, date: date, link: link));
      }

      return articles;
    } else {
      throw Exception('Failed to load page');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
