import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator NotificationsWidget - FRAME
    return Container(
        width: 375,
        height: 826,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(40, 30),
                blurRadius: 70)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 53,
              left: 19,
              child: Text(
                'Notifikasi',
                textAlign: TextAlign.left,
                style: kHeading6.copyWith(
                  color: kBlack,
                ),
              )),
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
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/support');
                                print("Button tapped");
                              },
                              child: Container(
                                width: 319,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24),
                                  ),
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
                              top: 22,
                              left: 17,
                              child: Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // Figma Flutter Generator Group127Widget - GROUP
                                    Container(
                                        width: 56.727272033691406,
                                        height: 56,
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 56.727272033691406,
                                                  height: 56,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                    ),
                                                    color: Color.fromRGBO(
                                                        247,
                                                        56,
                                                        89,
                                                        0.15000000596046448),
                                                  ))),
                                          Positioned(
                                              top: 9,
                                              left: 9,
                                              child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/icons/support.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ))),
                                        ])),
                                    SizedBox(width: 16),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Janggar Pranoto',
                                            textAlign: TextAlign.left,
                                            style: kHeading6.copyWith(
                                              color: kBlack,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'gubernur jawa tengah janggar...',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  123, 141, 158, 1),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ])),
                  ],
                ),
              ))
        ]));
  }
}
