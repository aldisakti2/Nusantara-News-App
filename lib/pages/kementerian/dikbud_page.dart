import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:nusantara_news_app/pages/home_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class KemendikbudPage extends StatelessWidget {
  const KemendikbudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          title: Text(
            'Kemendikbud News',
            style: kHeading6.copyWith(color: kBlack),
          ),
          leading: BackButton(
            color: kBlack,
          ),
          backgroundColor: kBgColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              color: kBgColor,
              child: Stack(
                children: [
                  ArticleListWidget(
                    futureArticles: _fetchData(
                        'https://www.kemdikbud.go.id/main/blog',
                        'strong a',
                        'small span',
                        'strong a'),
                    filterTag: "if (a[i].classList.contains('navbar'))",
                    OptionalWeb: "",
                  ),
                ],
              ),
            ),
          ),
        ));
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
