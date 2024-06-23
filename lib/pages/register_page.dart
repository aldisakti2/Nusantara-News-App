import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantara_news_app/bloc/register/register_cubit.dart';
import 'package:nusantara_news_app/styles/text_style.dart';
import 'package:nusantara_news_app/utils/routes.dart';
import 'package:nusantara_news_app/styles/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text(
          'Nusantara News',
          style: kHeading6.copyWith(
            color: kDarkBlue,
          ),
        ),
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Loading..')));
          }
          if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(
                context, rLogin, (route) => false);
          }
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 30),
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
                      context.read<RegisterCubit>().register(
                          email: emailEdc.text, password: passEdc.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kBlueRibbon,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kBlueRibbon),
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
