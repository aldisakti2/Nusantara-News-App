import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/pages/home_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

class KemenakerPage extends StatelessWidget {
  const KemenakerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kemenaker News',
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
}
