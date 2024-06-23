import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/models/web_articles.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class KemenakerPage extends StatelessWidget {
  const KemenakerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          title: Text(
            'Kemenaker News',
            style: kHeading6.copyWith(color: kDarkBlue),
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
                    futureArticles: fetchNewsFromCollection('Kemenaker'),
                    filterTag:
                        "if (a[i].classList.contains('news-comment') || a[i].classList.contains('news-related') || a[i].localName.includes('navbar') || a[i].localName.includes('footer'))",
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
