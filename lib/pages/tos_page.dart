import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantara_news_app/styles/text_style.dart'; // Import your text styles

class TermsAndServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Service',
          style: kHeading5.copyWith(color: Colors.black), // Apply kHeading5 style
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Set app bar background color to white
        elevation: 0, // Ensure no elevation for consistent style
      ),
      body: Container(
        color: Colors.black, // Set body background color to black
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum accumsan felis, nec rutrum velit euismod vel. Duis vitae pharetra lacus, eget sodales purus. Cras vulputate purus sed urna sollicitudin, quis blandit neque sollicitudin.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Privacy Policy',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum accumsan felis, nec rutrum velit euismod vel. Duis vitae pharetra lacus, eget sodales purus. Cras vulputate purus sed urna sollicitudin, quis blandit neque sollicitudin.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Contact Us',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'For any questions regarding our Terms and Service, you can contact us at support@example.com.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
