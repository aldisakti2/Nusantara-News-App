import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const nameRoute = '/';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                            'Nusantara News',
                            style: kBody1.copyWith(
                              color: kMatterhornBlack,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Aldi Khan Sakti A. ',
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
                                color: kGrey,
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
/*
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 319),
                    constraints: BoxConstraints.expand(height: 56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/search-rectangle.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                  ),*/
                  SizedBox(
                    height: 22.78,
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
                ],
              ),
            ),
            /*Container(
                margin: EdgeInsets.only(top: 85),
                child: DraggableScrollableSheet(
                    builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 21,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 14 + 4),
                          child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'Transaction History',
                                      style: kHeading6.copyWith(
                                        color: kPeacoat,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 31,
                                  ),
                                  _transactionList(
                                      kTreeGreen.withOpacity(0.2),
                                      'assets/icons/triangle-up.png',
                                      'Success',
                                      'February 19, 03:25 PM',
                                      '+ 100.000'),
                                  _transactionList(
                                      kTreeGreen.withOpacity(0.2),
                                      'assets/icons/triangle-up.png',
                                      'Success',
                                      'February 16, 01:25 PM',
                                      '+ 150.000'),
                                  _transactionList(
                                      kOrange.withOpacity(0.2),
                                      'assets/icons/triangle-down.png',
                                      'Starbucks Drinks',
                                      'February 10, 12:25 PM',
                                      '- 110.000'),
                                  _transactionList(
                                      kOrange.withOpacity(0.2),
                                      'assets/icons/triangle-down.png',
                                      'Payment #Invest',
                                      'February 5, 11:05 PM',
                                      '- 130.000'),
                                ],
                              )),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 4,
                            width: 49,
                            color: kEgyptianBlue.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              )
            ),*/
          ],
        ),
      ),
    );
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
        ]
            /*
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 2,
              ),
              Image.asset(
                icon1,
                height: 20,
                width: 20,
              ),
              Text(
                text,
                style: kSubtitlemid2.copyWith(color: kLightGray),
              ),
              SizedBox(
                width: 128,
              ),
              Image.asset(
                icon2,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 5,
              ),
            ],*/
            ),
      ),
    );
  }
}
