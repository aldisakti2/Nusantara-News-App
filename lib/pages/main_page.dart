import 'package:flutter/material.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'home_page.dart';
import 'support_page.dart';
import 'feedback_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nusantara_news_app/pages/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  User? user;

  static List<Widget> pages = [
    HomePage(),
    SupportPage(),
    FeedbackPage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _checkUserStatus();
    });
  }

  void _checkUserStatus() {
    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });
  }

  Future<void> _onItemTapped(int index) async {
    if (index == 3) {
      _handleProfileTap();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _handleProfileTap() {
    if (user == null) {
      // Navigate to the LoginScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ).then((_) {
        _checkUserStatus(); // Refresh the user state after returning from the login screen
      });
    } else {
      // Perform logout
      _signOut();
    }
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    // After sign-out, update the user state and stay on the homepage
    setState(() {
      _selectedIndex = 0;
    });
    _checkUserStatus();
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
                  'assets/icons/kritiksaran.png',
                  width: 24,
                  color: _selectedIndex == 2 ? kBlueRibbon : kDarkGray,
                ),
                label: 'Kritik & Saran'),
            BottomNavigationBarItem(
              icon: user == null
                  ? Image.asset(
                      'assets/icons/profile.png',
                      width: 24,
                      color: _selectedIndex == 3 ? kBlueRibbon : kDarkGray,
                    )
                  : Icon(
                      Icons.logout,
                      color: _selectedIndex == 3 ? kBlueRibbon : kDarkGray,
                    ),
              label: user == null ? 'SignIn' : 'LogOut',
            ),
          ],
        ),
      ),
    );
  }
}
