import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  TextEditingController whatssapController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              child: Text('Ayo kumpulkan koin penjemputan sampah!',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                height: 440,
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
                          child: Text('Nomor Whatssap/Email')),
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
                            context.go('/HomePage');
                          },
                          child: const Text("Masuk"),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lupa Password?',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFFF7F33)),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Tidak Memiliki Akun',
                            style: TextStyle(color: Color(0xFFB3BCC5)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
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
                          child: const Text("Daftar Akun"),
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
