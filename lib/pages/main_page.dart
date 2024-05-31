import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/login_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'home_page.dart';
import 'portofolio_page.dart';
import 'support_page.dart';
import 'profile_page.dart';
import 'register_page.dart';
//import 'other_home_page.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);

Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;

  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: LoginPage(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterScreen(), settings: settings);
      break;
    case rHome:
      _route = _pageRoute(body: HomePage(), settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/home';

class MainPage extends StatefulWidget {
  static var routeName;

  const MainPage({Key? key}) : super(key: key);
  static const nameRoute = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> pages = [
    HomePage(),
    PortofolioPage(),
    SupportPage(),
    ProfilePage(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: pages[_selectedIndex],
      bottomNavigationBar: _customBottomNav(),
    );
  }

  Widget _customBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: kGrey,
              blurRadius: 10,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: kCaption,
          unselectedLabelStyle: kCaption,
          selectedItemColor: kBlueRibbon,
          unselectedItemColor: kDarkGray,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  width: 24,
                  color: _selectedIndex == 0 ? kBlueRibbon : kDarkGray,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/question.png',
                  width: 24,
                  color: _selectedIndex == 1 ? kBlueRibbon : kDarkGray,
                ),
                label: 'Bantuan'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/phone.png',
                  width: 24,
                  color: _selectedIndex == 2 ? kBlueRibbon : kDarkGray,
                ),
                label: 'Kontak'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/notifications.png',
                  width: 24,
                  color: _selectedIndex == 3 ? kBlueRibbon : kDarkGray,
                ),
                label: 'Notifikasi'),
          ],
        ),
      ),
    );
  }
}
