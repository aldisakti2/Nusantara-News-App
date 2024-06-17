import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_state.dart';
import 'package:nusantara_news_app/models/web_articles.dart';
import 'package:nusantara_news_app/styles/colors.dart';

class ArticleListWidget extends StatelessWidget {
  final Future<List<Web_Article>> futureArticles;
  final String filterTag;
  final String optionalWeb;

  const ArticleListWidget({
    super.key,
    required this.futureArticles,
    required this.filterTag,
    required this.optionalWeb,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Web_Article>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: kBlueRibbon,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No articles found.'));
        } else {
          List<Web_Article> articles = snapshot.data!;
          saveArticles(articles); // Save articles to Firestore
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
                          selectedUrl: optionalWeb + article.link,
                          filtering: filterTag,
                          category: article.category,
                        ),
                      ),
                    );
                  },
                  child: _WebCard(article),
                ),
            ],
          );
        }
      },
    );
  }

  Widget _WebCard(Web_Article article) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.remove_red_eye,
                size: 16,
                color: Color(0xFF98A0A2),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                article.date,
                style: const TextStyle(color: Color(0xFF98A0A2)),
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
