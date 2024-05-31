import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/login_page.dart';
import 'package:nusantara_news_app/pages/main_page.dart';
import 'package:nusantara_news_app/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusantara News App',
      routes: {
        LoginPage.nameRoute: (context) => LoginPage(),
        MainPage.nameRoute: (context) => const MainPage(),
        RegisterPage.nameRoute: (context) => const RegisterPage(),
      },
    );
  }
}
