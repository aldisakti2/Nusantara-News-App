import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/models/web_articles.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class KemenkeuPage extends StatelessWidget {
  const KemenkeuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kemenkeu News',
            style: kHeading6.copyWith(color: kDarkBlue),
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
                    futureArticles: fetchNewsFromCollection('Kemenkeu'),
                    filterTag:
                        "if (a[i].classList.contains('kem-informasi-publik-publikasi-berita-utama-detail__header') || a[i].classList.contains('kem-o-navbar-mobile') || a[i].classList.contains('kem-data-layanan__content-news-update') || a[i].localName.includes('footer'))",
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
