part of '../pages.dart';

class SuccessPenjemputan extends StatelessWidget {
  const SuccessPenjemputan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
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
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Selamat!!',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Kamu telah berhasil menabung sampah,\ndengan ini kamu sudah membantu\nmenjaga lingkungan',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF8D50),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    context.go("/NavigasiBar");
                  },
                  child: const Text("Kembali ke Home"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
