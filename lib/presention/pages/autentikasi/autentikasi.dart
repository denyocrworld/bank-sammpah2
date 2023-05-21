part of '../pages.dart';

class AutentikasiScreen extends StatefulWidget {
  const AutentikasiScreen({super.key});

  @override
  State<AutentikasiScreen> createState() => _AutentikasiScreenState();
}

class _AutentikasiScreenState extends State<AutentikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Center(
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text(
                    'Autentikasi',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 8),
                // ignore: prefer_const_constructors
                child: Text(
                  'Masukan kode yang dikirim ke nomor telepon anda',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 32, color: Colors.blue),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '0',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue.shade700),
                          ),
                        ),
                        maxLines: 1,
                        cursorColor: const Color(0xFFF8FCFF),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 32, color: Colors.blue),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '0',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue.shade700),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 32, color: Colors.blue),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '0',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue.shade700),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 32, color: Colors.blue),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            context.go('/SuccesScreen');
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '0',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 3, color: Colors.blue.shade700),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 24),
                // ignore: prefer_const_constructors
                child: Text(
                  'Tidak menerima kode autentikasi?',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                child: Text(
                  'Kirim ulang kode?',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
