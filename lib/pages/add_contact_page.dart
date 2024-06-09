import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({Key? key}) : super(key: key);
  static const nameRoute = '/addcontact';

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
                        'Tambah Kontak',
                        textAlign: TextAlign.left,
                        style: kHeading6.copyWith(
                          color: kBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 105,
                    left: 19,
                    child: // Figma Flutter Generator Group10Widget - GROUP
                        Container(
                            width: 330,
                            height: 74,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 24,
                                  left: 0,
                                  child: Container(
                                      width: 330,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(2),
                                          topRight: Radius.circular(2),
                                          bottomLeft: Radius.circular(2),
                                          bottomRight: Radius.circular(2),
                                        ),
                                        color: Color.fromRGBO(249, 249, 249, 1),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1),
                                          width: 1,
                                        ),
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Name',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 39,
                                  left: 10,
                                  child: Text(
                                    'Enter name',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(158, 158, 158, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
