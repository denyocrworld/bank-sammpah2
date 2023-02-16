part of '../pages.dart';

class SuccesPass extends StatelessWidget {
  const SuccesPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 132),
              // ignore: prefer_const_constructors
              child: Align(
                alignment: Alignment.center,
                // ignore: prefer_const_constructors
                child: Text(
                  'Lupa Password',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 8),
              // ignore: prefer_const_constructors
              child: Text(
                'Masukan data yang digunakan mendaftar untuk konfirmasi',
                style: const TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Container(
                height: 232,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Color(0xFFF8FCFF),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Image.asset(
                        'asset/images/ceklis.png',
                        width: MediaQuery.of(context).size.width * 1,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'Password sudah terkirim ke email anda,\n'),
                            TextSpan(
                                text:
                                    'silahkan cek inbok untuk mengetahui password yang anda gunakan'),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // Text(
                      //   'Password sudah terkirim ke email anda, silahkan cek inbok untuk mengetahui password yang anda gunakan',
                      //   style: TextStyle(fontSize: 14),
                      //   textAlign: TextAlign.center,
                      // ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF7F33),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            context.go('/LoginScreen');
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
