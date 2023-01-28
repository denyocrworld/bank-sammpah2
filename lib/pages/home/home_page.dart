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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF019BF1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF00639C),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket),
            label: 'Reward',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
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
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 21, left: 210),
                    child: SizedBox(
                      height: 32,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Notifikasi',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 319,
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
                            child: const Text('Hi, Jond Doe'),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 6, left: 16),
                                    child: Text('Saldo Anda :'),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      'Rp 37.500',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: 80,
                                      height: 31,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFF7F33),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Isi Saldo",
                                          style: TextStyle(fontSize: 12),
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
                    child: Text('Layanan'),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFFF3FAFF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(99, 157, 238, 254),
                                radius: 30,
                                child: Image.asset(
                                  'asset/images/motr1.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Text(
                                  "Antar Jemput Sampah",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 20, left: 20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFFF3FAFF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(99, 157, 238, 254),
                                radius: 30,
                                child: Image.asset(
                                  'asset/images/uang.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 38),
                                child: Text(
                                  "Tukar Koin",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 20),
                        child: Text('Riwayat'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 164,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'Lihat semua',
                                style: TextStyle(color: Color(0xFFFF7F33)),
                              ),
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 320,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFDFF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black, width: 0.1),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, left: 16),
                                child: Text(
                                  '12 Januari 2023',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFA7ABB3)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 159, right: 16),
                                child: Text(
                                  '+150pt',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFA7ABB3)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 16),
                                child: Text(
                                  'Berat Sampah :',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF001F29)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 5),
                                child: Text(
                                  '4kg',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF001F29)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  left: 60,
                                  right: 16,
                                ),
                                child: Text(
                                  'Rp 15.000',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF019BF1)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 289,
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
                                  context.go('/RegisterScreen');
                                },
                                child: const Text("Lihat Detail"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 20),
                        child: Text('Artikel'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 175,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'Lihat semua',
                                style: TextStyle(color: Color(0xFFFF7F33)),
                              ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFDFF),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, left: 16),
                                  child: Text(
                                    '5 Tips to clean your home easily',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 16),
                                  child: Text(
                                    'This is description for card title, you can edit it as you want',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF72777F)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFDFF),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, left: 16),
                                  child: Text(
                                    '5 Tips to clean your home easily',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 16),
                                  child: Text(
                                    'This is description for card title, you can edit it as you want',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF72777F)),
                                  ),
                                )
                              ],
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
