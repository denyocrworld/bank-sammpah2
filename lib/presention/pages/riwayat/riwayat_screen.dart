part of '../pages.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Riwayat",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              context.go('/NavigasiBar');
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Color(0xFF001F29),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '12-08-2023',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xFFA7ABB3),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, right: 16),
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
                            padding: const EdgeInsets.only(top: 4, left: 16),
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
                              padding: const EdgeInsets.only(top: 4, left: 5),
                              child: Text(
                                '5kg',
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
                              'Rp 150000',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF019BF1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 16, left: 16),
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
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
