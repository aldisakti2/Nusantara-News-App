import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_state.dart';
import 'package:nusantara_news_app/pages/home_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class ArticleListWidget extends StatelessWidget {
  final Future<List<Article>> futureArticles;
  final String filterTag;
  final String OptionalWeb;

  const ArticleListWidget({
    Key? key,
    required this.futureArticles,
    required this.filterTag,
    required this.OptionalWeb,
  }) : super(key: key);

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
          return Column(
            children: [
              for (var article in articles)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          title: article.title,
                          selectedUrl: OptionalWeb + article.link,
                          filtering: filterTag,
                        ),
                      ),
                    );
                  },
                  child: _UpdateInfoPemerintah(article),
                ),
            ],
          );
        }
      },
    );
  }

  Widget _UpdateInfoPemerintah(Article article) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
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
