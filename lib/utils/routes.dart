import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../pages/main_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
=======
import '../pages/home_page.dart';
import '../pages/login.dart';
import '../pages/register.dart';
>>>>>>> 002ab33806692c0812a88cf89704cba9e9d5a23b

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);
<<<<<<< HEAD
Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;
=======

Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;

>>>>>>> 002ab33806692c0812a88cf89704cba9e9d5a23b
  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterScreen(), settings: settings);
      break;
<<<<<<< HEAD
    case rMain:
      _route = _pageRoute(body: MainPage(), settings: settings);
=======
    case rHome:
      _route = _pageRoute(body: HomePage(), settings: settings);
>>>>>>> 002ab33806692c0812a88cf89704cba9e9d5a23b
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
<<<<<<< HEAD
const String rMain = '/main';
=======
const String rHome = '/home';
>>>>>>> 002ab33806692c0812a88cf89704cba9e9d5a23b
