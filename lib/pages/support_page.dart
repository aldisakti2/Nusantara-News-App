import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class SupportPage extends StatelessWidget {
  SupportPage({Key? key}) : super(key: key);

  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 800,
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
                        'Bantuan',
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
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 319,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(107, 134, 179, 0.25),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'Menu Bantuan Rakyat',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                16), // Space between title and description
                                        Text(
                                          'Menu ini berisi Informasi lengkap mengenai layanan dan syarat yang dibutuhkan saat mengurus keperluan anda di aplikasi ini, selain itu juga terdapat Informasi mengenai Alamat Kantor Dpr.',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors
                                                .grey, // Change description text color to grey
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                8), // Space between paragraphs
                                        Text(
                                          'Caranya:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors
                                                .grey, // Change description text color to grey
                                          ),
                                        ),
                                        Text(
                                          '1. Klik Pilih Layanan\n'
                                          '2. Pilih layanan yang anda inginkan\n'
                                          '3. Lalu akan tertera Informasi lengkap tentang layanan yang anda butuhkan di Nusantara News',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors
                                                .grey, // Change description text color to grey
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 326,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/viewreport');
                                    print("Button tapped");
                                  },
                                  child: Container(
                                    width: 319,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              107, 134, 179, 0.25),
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
                                        'Status Laporan',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 426,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/tos');
                                    print("Button tapped");
                                  },
                                  child: Container(
                                    width: 319,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              107, 134, 179, 0.25),
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
                                        'Terms & Service',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 526,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/report');
                                    print("Button tapped");
                                  },
                                  child: Container(
                                    width: 319,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              107, 134, 179, 0.25),
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
                                        'Form Pengaduan',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
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
