part of '../pages.dart';

class SuccesScreen extends StatefulWidget {
  const SuccesScreen({super.key});

  @override
  State<SuccesScreen> createState() => _SuccesScreenState();
}

class _SuccesScreenState extends State<SuccesScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        context.go("/NavigasiBar");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 312,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Image.asset(
                          "asset/images/ceklis.png",
                          width: 128.0,
                          height: 128.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 32, right: 32),
                        child: Text(
                          'Selamat Pendaftaran Kamu Berhasil!',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 32, right: 32),
                        child: Text(
                          'Sebentar lagi kamu akan dialihkan menuju halaman utama',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
