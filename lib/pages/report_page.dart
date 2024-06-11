import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _ministryController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _submitReport() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      String location = _locationController.text;
      String ministry = _ministryController.text;

      // Add report to Firestore
      await firestore.collection('reports').add({
        'userId': user.uid,
        'title': title,
        'description': description,
        'location': location,
        'ministry': ministry,
        'timestamp': DateTime.now(),
      });

      // Clear text fields after submission
      _titleController.clear();
      _descriptionController.clear();
      _locationController.clear();
      _ministryController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report submitted successfully!'),
        ),
      );
    } else {
      // User is not signed in, handle this case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please sign in to submit a report.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 1000,
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
                        'Form Pengaduan',
                        textAlign: TextAlign.left,
                        style: kHeading6.copyWith(
                          color: kBlack,
                        ),
                      ),
                      SizedBox(width: 10),
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
                          height: 800,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 20,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
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
                                  child: Center(
                                    child: Text(
                                      'Layanan Pengaduan Online Rakyat Sampaikan laporan Anda langsung kepada instansi pemerintah berwenang',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey, // Change description text color to grey
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 170,
                                left: 0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Sampaikan Laporan Anda',
                                      textAlign: TextAlign.left,
                                      style: kHeading6.copyWith(
                                        color: kBlack,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 226,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: _titleController,
                                      decoration: InputDecoration(
                                        hintText: 'Ketik Judul Laporan Anda',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none, // Remove the underline
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the left
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left, // Align the text to the left
                                      maxLines: null, // Allow multiple lines of text
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 296,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _descriptionController,
                                    decoration: InputDecoration(
                                      hintText: 'Ketik Isi Laporan Anda',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(16.0), // Adjust padding for top-left alignment
                                    ),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: null,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 466,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: _locationController,
                                      decoration: InputDecoration(
                                        hintText: 'Ketik Lokasi Kejadian',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none, // Remove the underline
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the left
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left, // Align the text to the left
                                      maxLines: null, // Allow multiple lines of text
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 536,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: _ministryController,
                                      decoration: InputDecoration(
                                        hintText: 'Ketik Instansi Tujuan',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none, // Remove the underline
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the left
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left, // Align the text to the left
                                      maxLines: null, // Allow multiple lines of text
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 700, // Adjust the top value as needed
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 40, // Adjust the height as needed
                                  child: ElevatedButton(
                                    onPressed: _submitReport,
                                    child: Text('Submit Report'),
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
