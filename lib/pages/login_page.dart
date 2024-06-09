import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantara_news_app/bloc/login/login_cubit.dart';
import 'package:nusantara_news_app/pages/home_page.dart';
import 'package:nusantara_news_app/pages/phone_screen_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'package:nusantara_news_app/utils/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text(
          'Nusantara News',
          style: kHeading6.copyWith(
            color: kBlack,
          ),
        ),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Loading..')));
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(context, rMain, (route) => false);
          }
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'assets/images/Logo.png',
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Silahkan masukan email dan password anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: emailEdc,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: passEdc,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(passInvisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passInvisible = !passInvisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !passInvisible,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<LoginCubit>()
                          .login(email: emailEdc.text, password: passEdc.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3D4DE0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 30.0,
                ),
                /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle();
                      },
                      child: const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            'https://img2.pngdownload.id/20190228/qby/kisspng-google-logo-google-account-g-suite-google-images-g-icon-archives-search-png-5c77ad39b77471.9286340315513470017515.jpg'),
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneAuthScreen()));
                      },
                      child: const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            'https://freepngimg.com/thumb/business/83615-blue-icons-symbol-telephone-computer-logo.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3D4DE0)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
