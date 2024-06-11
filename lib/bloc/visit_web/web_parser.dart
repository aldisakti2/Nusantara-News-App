import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/home_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class ArticleListWidget extends StatelessWidget {
  final Future<List<Article>> futureArticles;
  final String titleSelector;
  final String dateSelector;
  final String kementerian_category;

  const ArticleListWidget(
      {Key? key,
      required this.futureArticles,
      required this.titleSelector,
      required this.dateSelector,
      required this.kementerian_category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No articles found.'));
        } else {
          List<Article> articles = snapshot.data!;
          return SizedBox(
            height: 208,
            width: 320,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return _UpdateInfoPemerintah(
                    articles[index], kementerian_category);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildArticleCard(Article article, String category) {
    return Card(
      child: Container(
        width: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.yellow[100],
        ),
        child: Row(
          children: [
            Container(
              width: 72,
              height: 99,
              margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.yellow[700],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    article.date.split(' ')[1],
                    style: kHeading5.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    article.date.split(' ')[2],
                    style: kHeading5.copyWith(
                      color: kWhite,
                    ),
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
                    category,
                    style: kSubtitlemid2.copyWith(
                      color: Colors.yellow[700],
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    truncateTitle(article.title),
                    style: kHeading6.copyWith(color: Colors.yellow[700]),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    article.date,
                    style: kCaption.copyWith(
                      color: Color.fromARGB(255, 255, 175, 71).withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _UpdateInfoPemerintah(Article article, String category) {
    return SizedBox(
      width: 320,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              truncateTitle(article.title),
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
                  article.date,
                  style: kNumber.copyWith(color: Color(0xFF98A0A2)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length > 4) {
      return '${words.sublist(0, 3).join(' ')} ...';
    } else {
      return title;
    }
  }
}
