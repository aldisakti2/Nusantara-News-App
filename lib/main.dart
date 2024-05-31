import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/login_page.dart';
import 'package:nusantara_news_app/pages/main_page.dart';
import 'package:nusantara_news_app/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusantara News App',
      routes: {
        LoginPage.nameRoute: (context) => LoginPage(),
        MainPage.nameRoute: (context) => const MainPage(),
        RegisterScreen.nameRoute: (context) => const RegisterScreen(),
      },
    );
  }
}
