import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);
  static const nameRoute = '/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 826,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(40, 30),
                  blurRadius: 70,
                ),
              ],
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 53,
                  left: 19,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Kontak',
                        textAlign: TextAlign.left,
                        style: kHeading6.copyWith(
                          color: kBlack,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          print("Add button tapped");
                          Navigator.pushNamed(context, '/addcontact');
                          print("Button tapped");
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue, // Background color of the button
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white, // Icon color
                            size: 16, // Icon size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 105,
                  left: 19,
                  child: Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 319,
                          height: 100,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/chat');
                                    print("Button tapped");
                                  },
                                  child: Container(
                                    width: 319,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(107, 134, 179, 0.25),
                                          offset: Offset(0, 2),
                                          blurRadius: 12,
                                        ),
                                      ],
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(190, 202, 218, 1),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        width: 56.727272033691406,
                                        height: 56,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                width: 56.727272033691406,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    topRight: Radius.circular(20),
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                  ),
                                                  image: DecorationImage(
                                                    image: AssetImage('assets/images/user-aldi.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  color: Color.fromRGBO(107, 134, 179, 0.25),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Kepala Suku',
                                              textAlign: TextAlign.left,
                                              style: kHeading6.copyWith(
                                                color: kBlack,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '+6218182221',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color.fromRGBO(123, 141, 158, 1),
                                                fontSize: 14,
                                              ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

