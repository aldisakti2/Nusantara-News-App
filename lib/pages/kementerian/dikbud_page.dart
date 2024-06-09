import 'package:flutter/material.dart';
import 'package:nusantara_news_app/bloc/visit_web/web_state.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class KemendikbudPage extends StatelessWidget {
  const KemendikbudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kemendikbud News',
            style: kHeading6.copyWith(color: kBlack),
          ),
          leading: BackButton(
            color: kBlack,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Stack(
                children: [
                  _berita(
                      'Kemendikbudristek Lepas Pelayaran Muhibah Budaya Jalur Rempah 2024',
                      '34', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewPage(
                              title: 'KemendikBud',
                              selectedUrl:
                                  'https://www.kemdikbud.go.id/main/blog/2024/06/kemendikbudristek-lepas-pelayaran-muhibah-budaya-jalur-rempah-2024')),
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }

  Widget _berita(String title, String view, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kSubtitlemid3,
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/eye.png",
                  height: 16,
                  fit: BoxFit.cover,
                  color: Color(0xFF98A0A2),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  view,
                  style: kNumber.copyWith(color: Color(0xFF98A0A2)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
