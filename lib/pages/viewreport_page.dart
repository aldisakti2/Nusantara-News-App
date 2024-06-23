import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nusantara_news_app/styles/colors.dart'; // Adjust according to your color styles
import 'package:nusantara_news_app/styles/text_style.dart'; // Adjust according to your text styles

class ViewReportsPage extends StatefulWidget {
  @override
  _ViewReportsPageState createState() => _ViewReportsPageState();
}

class _ViewReportsPageState extends State<ViewReportsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text('sign in terlebih dahulu untuk melihat laporan yang anda kirim.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Anda',
          style: kHeading5.copyWith(color: kBlack), // Adjust according to your text styles
        ),
        backgroundColor: Colors.white, // Set app bar background color to white
        elevation: 0, // Ensure no elevation for consistent style
      ),
      backgroundColor: Colors.white, // Set scaffold background color to white
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('reports').where('userId', isEqualTo: user.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var reports = snapshot.data!.docs;

          if (reports.isEmpty) {
            return Center(child: Text('No reports found.'));
          }

          return ListView.builder(
            itemCount: reports.length,
            itemBuilder: (context, index) {
              var report = reports[index];
              var data = report.data() as Map<String, dynamic>;
              var title = data['title'];
              var description = data['description'];
              var location = data['location'];
              var ministry = data['ministry'];
              var timestamp = (data['timestamp'] as Timestamp).toDate();
              var isRead = data.containsKey('isRead') ? data['isRead'] : false;

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Description: $description',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Location: $location',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Ministry: $ministry',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Timestamp: ${timestamp.toLocal()}',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        decoration: BoxDecoration(
                          color: isRead ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          '${isRead ? 'Read' : 'Not Read'}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
