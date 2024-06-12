import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        loggedInUser = user;
      });
    }
  }

  String getCensoredEmail(String email) {
    List<String> parts = email.split('@');
    if (parts[0].length > 5) {
      parts[0] = parts[0].substring(0, 5) + '*****';
    }
    return parts.join('@');
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('News Comment', textAlign: TextAlign.center),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            _firestore.collection('comment').orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                final emailEdc =
                    TextEditingController(text: data['email'].toString());
                final commentEdc =
                    TextEditingController(text: data['comment'].toString());
                bool isOwnComment =
                    loggedInUser != null && loggedInUser!.uid == data['userId'];

                return SizedBox(
                  height: 170.0,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color:
                        isOwnComment ? Colors.lightBlue.shade50 : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(data['email'],
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.0)),
                              ),
                              if (isOwnComment)
                                GestureDetector(
                                    onTap: () {},
                                    child: PopupMenuButton<String>(
                                      onSelected: (value) {
                                        if (value == 'edit') {
                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          controller: emailEdc,
                                                        ),
                                                        const SizedBox(
                                                            height: 10.0),
                                                        SizedBox(
                                                            height: 300,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  commentEdc,
                                                              maxLines:
                                                                  null, // Set this
                                                              expands:
                                                                  true, // and this
                                                              keyboardType:
                                                                  TextInputType
                                                                      .multiline,
                                                            )),
                                                        Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                            child: SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child:
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () async {
                                                                          if (_formKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            try {
                                                                              await _firestore.collection('comment').doc(document.id).update({
                                                                                'email': emailEdc.text,
                                                                                'comment': commentEdc.text,
                                                                                'timestamp': FieldValue.serverTimestamp(),
                                                                              });
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                    backgroundColor: Colors.green,
                                                                                    content: Text(
                                                                                      'Comment Update Successfull...',
                                                                                      style: kSubtitlemid3.copyWith(color: kWhite),
                                                                                    )),
                                                                              );
                                                                              Navigator.pop(context);
                                                                            } catch (e) {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(content: Text('$e')),
                                                                              );
                                                                            }
                                                                          }
                                                                        },
                                                                        child: const Text(
                                                                            'Save'))))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        } else if (value == 'delete') {
                                          String documentId = document.id;
                                          _firestore
                                              .collection('comment')
                                              .doc(documentId)
                                              .delete();
                                        }
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        const PopupMenuItem<String>(
                                          value: 'edit',
                                          child: Text('Edit'),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'delete',
                                          child: Text('Hapus'),
                                        ),
                                      ],
                                      child: Icon(Icons.more_vert_outlined),
                                    ))
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(data['comment'],
                              textAlign: TextAlign.justify,
                              maxLines: 5,
                              style: const TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (loggedInUser == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Please login to add a comment',
                      style: kSubtitlemid2.copyWith(color: kWhite))),
            );
            return;
          }
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: TextEditingController(
                              text: getCensoredEmail(loggedInUser!.email!)),
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                            height: 300,
                            child: TextFormField(
                                controller: commentController,
                                maxLines: null, // Set this
                                expands: true, // and this
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                    hintText: 'Write a comment',
                                    filled: true))),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          await _firestore
                                              .collection('comment')
                                              .add({
                                            'email': getCensoredEmail(
                                                loggedInUser!.email!),
                                            'comment': commentController.text,
                                            'userId': loggedInUser!.uid,
                                            'timestamp':
                                                FieldValue.serverTimestamp(),
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                'Comment Successfully Added',
                                                style: kSubtitlemid3.copyWith(
                                                    color: kWhite),
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(content: Text('$e')),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text('Save'))))
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
