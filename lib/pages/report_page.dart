import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'dart:io';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _ministryController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _submitReport() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      String location = _locationController.text;
      String ministry = _ministryController.text;

      String? imageUrl;
      if (title.isEmpty || description.isEmpty || location.isEmpty || ministry.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill in all fields.'),
          ),
        );
        return;
      }
      if (_image != null) {
        imageUrl = await _uploadImage(user.uid);
        if (imageUrl == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to upload image. Please try again.'),
            ),
          );
          return;
        }
      }

      try {
        await firestore.collection('reports').add({
          'userId': user.uid,
          'title': title,
          'description': description,
          'location': location,
          'ministry': ministry,
          'timestamp': DateTime.now(),
          'imageUrl': imageUrl,
          'isRead': false,
        });

        _titleController.clear();
        _descriptionController.clear();
        _locationController.clear();
        _ministryController.clear();
        setState(() {
          _image = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Report submitted successfully!'),
          ),
        );
      } catch (e) {
        print('Error submitting report: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit report. Please try again.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please sign in to submit a report.'),
        ),
      );
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(String userId) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('reports/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg');
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      print('Image uploaded successfully: $imageUrl');  // Add logging
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');  // Improved error logging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading image: $e'),
        ),
      );
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 1100,
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
                          height: 1100,
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
                                top: 640,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: _image == null ? 200 : 200, // Adjusted height based on image presence
                                  child: GestureDetector(
                                    onTap: _getImage,
                                    child: _image == null
                                        ? Icon(
                                      Icons.add_a_photo,
                                      color: Colors.blue,
                                      size: 200, // Adjust the size of the icon
                                    )
                                        : Image.file(_image!, fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 860,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: _submitReport,
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.lightBlue),
                                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                                    ),
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
