import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_parser.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'package:nusantara_news_app/models/web_articles.dart';

class KemendikbudPage extends StatelessWidget {
  const KemendikbudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          title: Text(
            'Kemendikbud News',
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
                      futureArticles: fetchNewsFromCollection('Kemendikbud'),
                      filterTag: "if (a[i].classList.contains('navbar'))"),
                ],
              ),
            ),
          ),
        ));
  }
}
