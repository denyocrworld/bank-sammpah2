part of '../pages.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;
  bool hideConfigPassword = true;

  TextEditingController namaController = TextEditingController();
  TextEditingController whatssapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController configpassController = TextEditingController();

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void changeConfigPasswordVisibility() {
    setState(() {
      hideConfigPassword = !hideConfigPassword;
    });
  }

  bool isProfileCompleted() {
    if (whatssapController.text.isNotEmpty &&
        namaController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        configpassController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: Text(
                'Daftar Akun',
                style: TextStyle(fontSize: 31, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Ayo daftar sekarang untuk mengumpukan koin penjemputan sampah!',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 588,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffF8FCFF),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Image.asset(
                        'asset/images/kasek.png',
                        width: 64,
                        height: 32,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          'Nama',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          controller: namaController,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Nama anda disini",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          'Nomor Whatssap',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          controller: whatssapController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "081234567890",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email anda disini",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: hidePassword,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  changePasswordVisibility();
                                },
                                child: Icon(
                                  (hidePassword)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                )),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          'Konfirmasi Password',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 36,
                        child: TextFormField(
                          controller: configpassController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: hideConfigPassword,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  changeConfigPasswordVisibility();
                                },
                                child: Icon(
                                  (hideConfigPassword)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                )),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Konfirmasi Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF7F33),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: isProfileCompleted()
                              ? () {
                                  context.go('/AutentikasiScreen');
                                }
                              : null,
                          child: const Text("Daftar"),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          context.go('/LoginScreen');
                        },
                        child: Text(
                          'Sudah Punya Akun ?',
                          style: TextStyle(color: Color(0xFFFF7F33)),
                        )),
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
