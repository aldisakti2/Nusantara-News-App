import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/login/login_cubit.dart';
import 'package:nusantara_news_app/utils/routes.dart';
import '../pages/login.dart';
import 'package:nusantara_news_app/pages/main_page.dart';
import 'package:nusantara_news_app/pages/register.dart';

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
        LoginScreen.nameRoute: (context) => const LoginScreen(),
        MainPage.nameRoute: (context) => const MainPage(),
        RegisterScreen.nameRoute: (context) => const RegisterScreen(),
      },
    );
  }
}
