import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final TextEditingController feedbackController = TextEditingController();
  Widget build(BuildContext context) {
    // Figma Flutter Generator OnboardingpageWidget - FRAME
    return Container(
        width: 375,
        height: 810,
        decoration: BoxDecoration(
          boxShadow : [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(40,30),
              blurRadius: 70
          )],
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 257,
                  left: 92,
                  child: Container(
                      width: 219,
                      height: 169,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ),Positioned(
                top: 573,
                left: 104,
                child: Container(
                  width: 300,
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 7,
                        left: 8.919185638427734,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(162, 154, 154, 1),
                            borderRadius: BorderRadius.circular(8), // Add border radius for rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust padding as needed
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Let’s Get Started',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NunitoSans',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                  decoration: TextDecoration.none, // Explicitly remove any text decoration
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
            ]
        )
    );
  }
}
