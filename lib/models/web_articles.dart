import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

class Web_Article {
  final String title;
  final String link;
  final String date;
  final String category;

  Web_Article({
    required this.title,
    required this.link,
    required this.date,
    required this.category,
  });

  // Factory constructor to create an Article from a Firestore document
  factory Web_Article.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Web_Article(
      title: data['title'] ?? '',
      link: data['link'] ?? '',
      date: data['date'] ?? '',
      category: data['category'] ?? '',
    );
  }

  // Convert an Article to a Map for uploading to Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'date': date,
      'category': category,
    };
  }
}

Future<void> saveArticleToFirestore(Web_Article article) async {
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection(article.category);

  // Create a new document with the article's title
  final documentRef = collectionRef.doc(article.title);

  // Set the document data
  await documentRef.set(article.toMap());
}

void saveArticles(List<Web_Article> articles) {
  for (var article in articles) {
    saveArticleToFirestore(article);
  }
}

Future<List<Web_Article>> fetchData(
  String url,
  String titleSelector,
  String dateSelector,
  String linkSelector,
  String category,
) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final htmlDocument = htmlParser.parse(response.body);
      final titleElements = htmlDocument.querySelectorAll(titleSelector);
      final dateElements = htmlDocument.querySelectorAll(dateSelector);
      final linkElements = htmlDocument.querySelectorAll(linkSelector);

      List<Web_Article> articles = [];

      for (int i = 0; i < titleElements.length; i++) {
        final title = titleElements[i].text.trim();
        final date = dateElements.isNotEmpty && i < dateElements.length
            ? dateElements[i].text.trim()
            : 'No date found';
        final link = linkElements[i].attributes['href'] ?? '';

        articles.add(Web_Article(
            title: title, date: date, link: link, category: category));
      }

      return articles;
    } else {
      throw Exception('Failed to load page');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
