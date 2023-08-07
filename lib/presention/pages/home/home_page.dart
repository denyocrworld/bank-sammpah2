part of '../pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit(HomeRespositoryImpl());
  }

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, homeState) {
          if (homeState is HomeIsSuccess) {
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
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  'Notifikasi',
                                  style: const TextStyle(
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
                                "Hi,${homeState.data.profile.username}",
                                style: TextStyle(
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
                                  child: Text(
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
                                      '${homeState.data.profile.balance}',
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
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                '${homeState.data.profile.image}',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.white, width: 1.5)),
                      //
                    ),
                    // Image.network('${homeState.data.profile.image}'),
                    // Icon(
                    //   Icons.account_circle,
                    //   size: 30.0,
                    //   color: Colors.grey,
                    // ),
                    mini: true,
                    backgroundColor: Colors.white,
                    elevation: 1,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      context.go("/LayananScreen");
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
                                      context.go("/BankSampahScreen");
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
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Text(
                                      'Lihat semua',
                                      style: const TextStyle(
                                          color: Color(0xFFFF7F33),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 14,
                                      color: const Color(0xFFFF7F33),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAFDFF),
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: Colors.black, width: 0.1),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, left: 16),
                                      // ignore: prefer_const_constructors
                                      child: Text(
                                        "12-04-2023",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: const Color(0xFFA7ABB3),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
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
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 5),
                                        child: Text(
                                          '6kg',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF001F29),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: 40,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color(0xFFFF7F33)),
                                        foregroundColor: Color(0xFFFF7F33),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                      ),
                                      onPressed: () {
                                        context.go('/DetailRiwayat');
                                      },
                                      child: const Text("Lihat Detail",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                ),
                              ],
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
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
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
                                      color: const Color(0xFFFF7F33),
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
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Expanded(
                                        child: Container(
                                          height: 200,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFAFDFF),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 0.1),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Image.asset(
                                                  'asset/images/pencuci.png',
                                                  height: 100,
                                                  fit: BoxFit.fill),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16, left: 16),
                                                child: ReadMoreText(
                                                  'Bank Sampah',
                                                  trimLines: 1,
                                                  colorClickableText:
                                                      Colors.grey,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText: '',
                                                  trimExpandedText: 'Show less',
                                                  moreStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, left: 16),
                                                child: ReadMoreText(
                                                  'Bank sampah adalah aplikasi pengelolaan ',
                                                  trimLines: 2,
                                                  colorClickableText:
                                                      Colors.grey,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      'Show more',
                                                  trimExpandedText: 'Show less',
                                                  moreStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Expanded(
                                        child: Container(
                                          height: 200,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFAFDFF),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 0.1),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Image.asset(
                                                  'asset/images/pencuci.png',
                                                  height: 100,
                                                  fit: BoxFit.fill),
                                              // ignore: prefer_const_constructors
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16, left: 16),
                                                // ignore: prefer_const_constructors
                                                child: ReadMoreText(
                                                  'Bank sampah',
                                                  trimLines: 1,
                                                  colorClickableText:
                                                      Colors.grey,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText: '',
                                                  trimExpandedText: 'Show less',
                                                  moreStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              // ignore: prefer_const_constructors
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, left: 16),
                                                // ignore: prefer_const_constructors
                                                child: ReadMoreText(
                                                  'bank sampah adalah',
                                                  trimLines: 2,
                                                  colorClickableText:
                                                      Colors.grey,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      'Show more',
                                                  trimExpandedText: 'Show less',
                                                  moreStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  // ignore: prefer_const_constructors
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (homeState is HomeIsLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: Text(
              "Kosong",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
