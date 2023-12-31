// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loginandsignup/model/costum_shapes.dart';
import 'package:loginandsignup/presention/navigasiton/route.dart';
import 'package:loginandsignup/presention/pages/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // late HomeCubit _homeCubit;

  // @override
  // void initState() {
  //   super.initState();
  //   _homeCubit = HomeCubit(HomeRespositoryImpl());
  // }

  // @override
  // void dispose() {
  //   _homeCubit.close();
  //   super.dispose();
  // }
  String urlImage = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("APP_STATE: $state");

    if (state == AppLifecycleState.inactive) {
      // user returned to our app
      const HomeScreen();
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user quit our app temporally
    } else if (state == AppLifecycleState.resumed) {
      // app suspended
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, homeState) {
          if (homeState is HomeIsLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          } else if (homeState is HomeIsSuccess) {
            final data = homeState.data;
            urlImage = data.profile.image;
            return Stack(
              children: <Widget>[
                ClipPath(
                  clipper: Customshape(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    color: Colors.blue,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 21,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 32,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: const Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  'Notifikasi',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                // ignore: prefer_const_constructors
                                Icon(
                                  Icons.notifications,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 0.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 92,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black, width: 0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(top: 24, left: 16),
                              child: Text(
                                "Hi,${data.profile.username}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ignore: prefer_const_constructors
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 6, left: 16),
                                  child: const Text(
                                    'Saldo Anda : ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                Expanded(
                                  // ignore: prefer_const_constructors
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 6, left: 8),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '${data.profile.balance}',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: SizedBox(
                                    width: 80,
                                    height: 31,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFF7F33),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "Isi Saldo",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 36),
                  child: FloatingActionButton(
                    onPressed: () {
                      context.go("/Profile");
                    },
                    // Image.network('${homeState.data.profile.image}'),
                    // Icon(
                    //   Icons.account_circle,
                    //   size: 30.0,
                    //   color: Colors.grey,
                    // ),
                    mini: true,
                    backgroundColor: Colors.white,
                    elevation: 1,
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: urlImage != null
                            ? const CircleAvatar(
                                backgroundImage:
                                    AssetImage('asset/images/user-circle.png'),
                                maxRadius: 50,
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data.profile.image),
                                maxRadius: 50,
                              )),
                    //  Container(
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: urlImage != "" ? :

                    //           NetworkImage(
                    //             homeState.data.profile.image,
                    //           ),
                    //           fit: BoxFit.cover),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(50)),
                    //       border: Border.all(color: Colors.white, width: 1.5)),
                    //   //
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text('Layanan',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 20),
                                child: Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      context.goNamed(Routes.LayananScreen);
                                    },
                                    child: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFFF3FAFF),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    99, 157, 238, 254),
                                            radius: 30,
                                            child: Image.asset(
                                              'asset/images/motr1.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 18),
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "Antar Jemput Sampah",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 20, left: 20),
                                child: Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.goNamed(Routes.BankSampahScreen);
                                    },
                                    child: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFFF3FAFF),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    99, 157, 238, 254),
                                            radius: 30,
                                            child: Image.asset(
                                              'asset/images/uang.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 18),
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "Bank Sampah /& Tukar Poin",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(top: 12, left: 20),
                              child: const Text('Riwayat',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, right: 20),
                              child: TextButton(
                                onPressed: () {
                                  context.go("/RiwayatScreen");
                                },
                                child: const Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Text(
                                      'Lihat semua',
                                      style: TextStyle(
                                          color: Color(0xFFFF7F33),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 14,
                                      color: Color(0xFFFF7F33),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: homeState.data.riwayat == null
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFAFDFF),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: Colors.black, width: 0.1),
                                  ),
                                  child: Column(
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          // ignore: prefer_const_constructors
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 16, left: 16),
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              "12-04-2023",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFA7ABB3),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 16, right: 16),
                                            child: Text(
                                              '+150pt',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFA7ABB3),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 4, left: 16),
                                            child: Text(
                                              'Berat Sampah :',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF001F29),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, left: 5),
                                              child: Text(
                                                '6kg',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF001F29),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 4,
                                              right: 16,
                                            ),
                                            child: Text(
                                              'Rp150000',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF019BF1),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 16, left: 16),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          height: 40,
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  color: Color(0xFFFF7F33)),
                                              foregroundColor:
                                                  const Color(0xFFFF7F33),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12), // <-- Radius
                                              ),
                                            ),
                                            onPressed: () {
                                              context.go('/DetailRiwayat');
                                            },
                                            child: const Text("Lihat Detail",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    'Belum ada riwayat anatar jemput\nYuk mulai bereskan sampah mu',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(top: 12, left: 20),
                              child: const Text('Artikel',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                right: 20,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Lihat semua',
                                      style: TextStyle(
                                          color: Color(0xFFFF7F33),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 14,
                                      color: Color(0xFFFF7F33),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(
                                                  16,
                                                ),
                                              ),
                                              child: Image.asset(
                                                'asset/images/pencuci.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                height: 110,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                '5 Tips to clean your home easily',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(
                                                  16,
                                                ),
                                              ),
                                              child: Image.asset(
                                                'asset/images/pencuci.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                height: 110,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                '5 Tips to clean your home easily',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text(
              "Data Not Found",
            ),
          );
        },
      ),
    );
  }
}
