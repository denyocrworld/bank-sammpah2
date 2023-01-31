part of '../pages.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;

  TextEditingController namaController = TextEditingController();
  TextEditingController whatssapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 132),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Masuk Akun',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align (
                  alignment: Alignment.center,
                    child : Text('Ayo daftar sekarang untuk mengumpulkan koin \n penjemputan sampah!',
                      style: TextStyle(fontSize: 14, color: Colors.white),textAlign: TextAlign.center,
                    ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                height: 580,
                width: 321,
                decoration: BoxDecoration(
                    color: Color(0xFFF8FCFF),
                    borderRadius: BorderRadius.circular(16)),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nama'),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 36,
                        width: 289,
                        child: TextFormField(
                          controller: namaController,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Nama Anda Disini",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nomor Whatsapp')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 36,
                        width: 289,
                        child: TextFormField(
                          controller: whatssapController,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "081234567890",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 36,
                        width: 289,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email Anda Disini",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 36,
                        width: 289,
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: hidePassword,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  changePasswordVisibility();
                                },
                                child: Icon(
                                  (hidePassword)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                )),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Konfirmasi Password')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 36,
                        width: 289,
                        child: TextFormField(
                          controller: confirmController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: hidePassword,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  changePasswordVisibility();
                                },
                                child: Icon(
                                  (hidePassword)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                )),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        height: 40,
                        width: 289,
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
                          child: const Text("Daftar"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child :TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sudah Punya Akun ?',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFFFF7F33)),
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
