import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantara_news_app/bloc/login/login_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class UserController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance; // Firestore instance
  final LoginCubit loginCubit;

  UserController(this.loginCubit);

  Future<User?> loginWithGoogle() async {
    try {
      loginCubit.emit(LoginLoading());
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      // Store user data in Firestore
      await addUserToFirestore(user, user?.uid); // Pass UID as the document ID

      loginCubit.emit(LoginSuccess('Login berhasil!'));
      return user;
    } catch (e) {
      loginCubit.emit(LoginFailure(e.toString()));
      return null;
    }
  }

  // Function to add user data to Firestore
  Future<void> addUserToFirestore(User? user, String? documentId) async {
    if (user != null) {
      await firestore.collection('users').doc(documentId).set({
        'name': user.displayName,
        'email': user.email,
        // You can add more user data here if needed
      });
    }
  }
}
