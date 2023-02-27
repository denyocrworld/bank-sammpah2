part of '../pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 16),
                        child: const Text(
                          'Hi, Jond Doe',
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
                            padding: const EdgeInsets.only(top: 6, left: 16),
                            child: const Text(
                              'Saldo Anda :',
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
                              padding: const EdgeInsets.only(top: 6, left: 8),
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Rp 37.500',
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
                                  backgroundColor: const Color(0xFFFF7F33),
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
              onPressed: () {},
              child: Icon(
                Icons.account_circle,
                size: 30.0,
                color: Colors.grey,
              ),
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
                          padding: const EdgeInsets.only(top: 8, left: 20),
                          child: Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFFF3FAFF),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(99, 157, 238, 254),
                                    radius: 30,
                                    child: Image.asset(
                                      'asset/images/motr1.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
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
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0xFFF3FAFF),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color.fromARGB(
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
                                      padding: const EdgeInsets.only(top: 18),
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
                        padding: const EdgeInsets.only(top: 12, right: 20),
                        child: TextButton(
                          onPressed: () {},
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
                        border: Border.all(color: Colors.black, width: 0.1),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, left: 16),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  '12 Januari 2023',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: const Color(0xFFA7ABB3),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, right: 16),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 16),
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
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 5),
                                  child: Text(
                                    '4kg',
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
                                  'Rp 15.000',
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
                              width: MediaQuery.of(context).size.width * 1,
                              height: 40,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Color(0xFFFF7F33)),
                                  foregroundColor: Color(0xFFFF7F33),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12), // <-- Radius
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Expanded(
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFDFF),
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'asset/images/pencuci.png',
                                      height: 100,
                                      width: 200,
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 16),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '5 Tips to clean your home easily',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 16),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      'This is description for card title, you can edit it as you want',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFF72777F),
                                          fontWeight: FontWeight.w400),
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
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFDFF),
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'asset/images/pencuci.png',
                                      height: 100,
                                      width: 200,
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 16),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '5 Tips to clean your home easily',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 16),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      'This is description for card title, you can edit it as you want',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFF72777F),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
