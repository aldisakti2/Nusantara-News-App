import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        color: kBgColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 35,
                right: 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat datang di',
                            style: kBody1.copyWith(
                              color: kMatterhornBlack,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Nusantara News ',
                            style: kHeading6.copyWith(
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints.expand(
                          height: 48,
                          width: 48,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/icons/profile.png'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kWhite,
                                blurRadius: 5,
                                offset: Offset.fromDirection(2),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      _searchButton('assets/icons/search.png', 'Search...',
                          'assets/icons/optimization.png'),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Info Layanan',
                          style: kHeading6.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: kPeacoat,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoLayanan(
                          'assets/images/kabupaten.png', 'Kabupaten', () {}),
                      SizedBox(width: 10),
                      _infoLayanan(
                          'assets/images/kecamatan.png', 'Kecamatan', () {}),
                      SizedBox(width: 11.09),
                      _infoLayanan(
                          'assets/images/kelurahan.png', 'Kelurahan', () {}),
                      SizedBox(width: 11.09),
                      _infoLayanan(
                          'assets/images/berita.png', 'Berita Terkini', () {}),
                          SizedBox(width: 11.09),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Berita Terbaru',
                          style: kHeading6.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: kPeacoat,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          child: Container(
                            width: 290,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.blue,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 72,
                                  height: 99,
                                  margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.blue[300],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '20',
                                        style: kHeading5.copyWith(
                                            color: kWhite,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'april',
                                        style: kHeading5.copyWith(
                                          color: kWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Proses pembagian bansos',
                                        style: kSubtitlemid2.copyWith(
                                            color: kWhite,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(height: 2.0),
                                      Text(
                                        'Bansos Happy',
                                        style:
                                            kHeading6.copyWith(color: kWhite),
                                      ),
                                      SizedBox(height: 3.0),
                                      Text(
                                        'untuk 700 kepala keluarga',
                                        style: kCaption.copyWith(
                                            color: kWhite.withOpacity(0.65)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            width: 290,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.yellow[100],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 72,
                                  height: 99,
                                  margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.yellow[700],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '20',
                                        style: kHeading5.copyWith(
                                            color: kWhite,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'april',
                                        style: kHeading5.copyWith(
                                          color: kWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Proses pembagian bansos',
                                        style: kSubtitlemid2.copyWith(
                                            color: Colors.yellow[700],
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(height: 2.0),
                                      Text(
                                        'Bansos Happy',
                                        style: kHeading6.copyWith(
                                            color: Colors.yellow[700]),
                                      ),
                                      SizedBox(height: 3.0),
                                      Text(
                                        'untuk 700 kepala keluarga',
                                        style: kCaption.copyWith(
                                            color: Color.fromARGB(
                                                    255, 255, 175, 71)
                                                .withOpacity(0.7)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Update Info Pemerintah',
                          style: kHeading6.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: kPeacoat,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 108,
                    width: 320,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bansos yang didistribusikan hari ini, 25 April 2020",
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
                                '400',
                                style:
                                    kNumber.copyWith(color: Color(0xFF98A0A2)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _transactionList(
      Color bgColor, String icon, String title, String sub, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: bgColor,
              child: Image(
                image: AssetImage(icon),
                width: 14,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kBody1.copyWith(color: kPeacoat),
              ),
              Text(
                sub,
                style: kCaption.copyWith(color: kVeryLightGray),
              ),
            ],
          ),
          Spacer(),
          Text(
            amount,
            style: kBody1.copyWith(color: kPeacoat),
          ),
        ],
      ),
    );
  }

  Widget _searchButton(String icon1, String text, String icon2) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(
          height: 56,
          width: 319,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/search-rectangle.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20), // Same padding on both sides
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10), // Same padding on both sides
                  hintText: 'Cari Info Layanan...',
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 24,
                    maxWidth: 24,
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      // Handle prefix icon tap
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 10), // Space between prefix icon and text
                      child: Image.asset(
                        icon1,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 24,
                    maxWidth: 24,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Handle suffix icon tap
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10), // Space between text and suffix icon
                      child: Image.asset(
                        icon2,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _infoLayanan(String img, String text, VoidCallback tap) {
  return GestureDetector(
    onTap: tap,
    child: Column(
      children: [
        Container(
          constraints: BoxConstraints.expand(
            height: 71.41,
            width: 71.41,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 4.5,
        ),
        Center(
          child: Text(
            text,
            style: kCaption.copyWith(
              color: kBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _beritaCardList(
    String date, String category, String title, String subtitle) {
  return Container(
    margin: EdgeInsets.only(
      left: 30,
      right: 30,
      top: 20,
    ),
    padding: EdgeInsets.fromLTRB(15, 19, 15, 14),
    constraints: BoxConstraints.expand(height: 150, width: 282),
    decoration: BoxDecoration(
      color: kDarkBlue,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          color: kGrey,
          blurRadius: 1,
          offset: Offset.fromDirection(1, 2),
        )
      ],
    ),
    child: Row(
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child: Container(
            height: 50,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kSubtitle1,
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                title,
                style: kBody2.copyWith(color: kGrey),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  subtitle,
                  style: kCaption.copyWith(color: kVeryLightGray),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
