import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the width and height of the device screen
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
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
            // Center the logo image
            Center(
              child: Container(
                width: 219,
                height: 169,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Align the text button near the bottom center
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100), // Adjust the bottom padding as needed
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(162, 154, 154, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Let’s Get Started',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NunitoSans',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
