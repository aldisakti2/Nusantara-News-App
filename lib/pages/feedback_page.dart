import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({Key? key}) : super(key: key);

  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40), // Adjust this value to move the header down
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(200, 173, 244, 0.224),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Kritik dan Saran',
                  style: kHeading6.copyWith(
                    color: kBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Form ini digunakan untuk menampung semua kritik dan saran dari Anda.',
                  style: kSubtitlemid2.copyWith(
                    color: kBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Form akan diterima oleh admin dan selalu di tampung kritik dan sarannya.',
                  style: kSubtitlemid2.copyWith(
                    color: kBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(77, 140, 248, 0.235),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(165, 10, 10, 0.239),
                  offset: Offset(40, 30),
                  blurRadius: 70,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Ada Kritik dan Saran? Yuk Tuliskan',
                  style: kHeading6.copyWith(color: kBlack),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: feedbackController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kGrey.withOpacity(0.1),
                    hintText: 'Tulis kritik dan saran Anda di sini...',
                    hintStyle: kSubtitlemid2.copyWith(color: kGrey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: kSubtitlemid2.copyWith(color: kBlack),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity, // Make the button take the full width
            child: ElevatedButton(
              onPressed: () {
                _submitFeedback(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Kirim',
                style: kSubtitle1.copyWith(color: kBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitFeedback(BuildContext context) async {
    if (feedbackController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kritik dan saran tidak boleh kosong')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('feedback').add({
        'feedback': feedbackController.text,
        'timestamp': Timestamp.now(),
      });
      feedbackController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kritik dan saran berhasil dikirim')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan, coba lagi')),
      );
    }
  }
}
