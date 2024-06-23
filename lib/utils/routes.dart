import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/report_page.dart';
import 'package:nusantara_news_app/pages/feedback_page.dart';
import 'package:nusantara_news_app/pages/support_page.dart';
import 'package:nusantara_news_app/pages/tos_page.dart';
import 'package:nusantara_news_app/pages/viewreport_page.dart';
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
    case rFeedback:
      _route = _pageRoute(body: FeedbackPage(), settings: settings);
      break;
    case rSupport:
      _route = _pageRoute(body: SupportPage(), settings: settings);
      break;
    case rReport:
      _route = _pageRoute(body: ReportPage(), settings: settings);
      break;
    case rViewReport:
      _route = _pageRoute(body: ViewReportsPage(), settings: settings);
      break;
    case rTos:
      _route = _pageRoute(body: TermsAndServicePage(), settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rMain = '/main';
const String rFeedback = '/feedback';
const String rSupport = '/support';
const String rReport = '/report';
const String rViewReport = '/viewreport';
const String rTos = '/tos';
