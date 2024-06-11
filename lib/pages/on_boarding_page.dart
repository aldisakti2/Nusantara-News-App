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
          ],
        ),
      ),
    );
  }
}
