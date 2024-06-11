import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantara_news_app/bloc/login/login_cubit.dart';

class UserController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

      loginCubit.emit(LoginSuccess('Login berhasil!'));
      return user;
    } catch (e) {
      loginCubit.emit(LoginFailure(e.toString()));
      return null;
    }
  }
}
