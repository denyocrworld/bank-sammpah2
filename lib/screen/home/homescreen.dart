import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../model/costum_shapes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: Customshape(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Notifikasi',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 100,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 319,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color(0xFF000000),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 100,
                                top: 20,
                                bottom: 0,
                                left: 16,
                              ),
                              child: Text('Hi, Jond Doe'),
                            )),
                        Flexible(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    left: 16,
                                  ),
                                  child: Text('Saldo Anda :'),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Rp 37,500',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          backgroundColor: Color(0xFFFF7F33)),
                                      onPressed: () {},
                                      child: Text(
                                        'Isi saldo',
                                        style: TextStyle(fontSize: 12),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 24, right: 0, bottom: 0),
                          child: Text('Layanan'),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 20,
                              bottom: 0,
                              right: 0,
                            ),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3FAFF),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 31,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(99, 157, 238, 254),
                                      radius: 30,
                                      child: Image.asset(
                                        'asset/images/motr1.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Antar Jenput Sampah',
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 20,
                              right: 20,
                              bottom: 0,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3FAFF),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Color.fromARGB(99, 157, 238, 254),
                                          radius: 30,
                                          child: Image.asset(
                                            'asset/images/uang.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0, 0.89),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Tukar Poin',
                                            style: TextStyle(fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(
                              'Riwayat',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: Row(
                              children: [
                                Text(
                                  'Lihat Semuanya',
                                  style: TextStyle(color: Colors.orange),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.chevron_right),
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 320,
                        height: 116,
                        color: Colors.blue,
                        child: Row(
                          children: [
                            Text('12 Januari 2023'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(
                              'Riwayat',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: Row(
                              children: [
                                Text(
                                  'Lihat Semuanya',
                                  style: TextStyle(color: Colors.orange),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.chevron_right),
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            color: Colors.blue,
                          ),
                          Container()
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          //Profil
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 30),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
