import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_state.dart';
import 'package:nusantara_news_app/pages/home_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

class KemenkeuPage extends StatelessWidget {
  const KemenkeuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kemenkeu News',
            style: kHeading6.copyWith(color: kBlack),
          ),
          leading: BackButton(
            color: kBlack,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Stack(
                children: [
                  _berita(
                      'Perlambatan Pertumbuhan Ekonomi Global, Menkeu Waspadai Perlambatan Penerimaan Negara',
                      '', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewPage(
                              title: 'Kemenkeu',
                              selectedUrl:
                                  'https://www.kemenkeu.go.id/informasi-publik/publikasi/berita-utama/Menkeu-Waspadai-Perlambatan-Penerimaan-Negara',
                              filtering:
                                  "if (a[i].classList.contains('kem-informasi-publik-publikasi-berita-utama-detail__header') || a[i].classList.contains('kem-o-navbar-mobile') || a[i].classList.contains('kem-data-layanan__content-news-update') || a[i].localName.includes('footer'))")),
                    );
                  }),
                  ArticleListWidget(
                    futureArticles: _fetchData(
                        'https://www.kemenkeu.go.id/informasi-publik/publikasi/berita-utama',
                        'div a.tw-text-body1',
                        'div.kem-informasi-publik-publikasi-berita-utama__content-other__date',
                        'div a.tw-text-body1'),
                    filterTag:
                        "if (a[i].classList.contains('kem-informasi-publik-publikasi-berita-utama-detail__header') || a[i].classList.contains('kem-o-navbar-mobile') || a[i].classList.contains('kem-data-layanan__content-news-update') || a[i].localName.includes('footer'))",
                    OptionalWeb: "https://www.kemenkeu.go.id",
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _berita(String title, String view, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Column(
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
          ],
        ),
      ),
    );
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
