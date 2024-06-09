import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/add_contact_page.dart';
import 'package:nusantara_news_app/pages/support_page.dart';
import '../pages/main_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);
Route? generateRoute(RouteSettings settings) {
  Route? _route;
  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterScreen(), settings: settings);
      break;
    case rMain:
      _route = _pageRoute(body: MainPage(), settings: settings);
      break;
    case rSupport:
      _route = _pageRoute(body: SupportPage(), settings: settings);
      break;
    case rAddContact:
      _route = _pageRoute(body: AddContactPage(), settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rMain = '/main';
const String rSupport = '/support';
const String rAddContact = '/addcontact';
