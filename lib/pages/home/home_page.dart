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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 21, left: 210),
                child: SizedBox(
                  height: 32,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'Notifikasi',
                          style: TextStyle(color: Colors.black, fontSize: 14),
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
          )
        ],
      ),
    );
  }
}
