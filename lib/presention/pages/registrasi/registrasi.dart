part of '../pages.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;

  bool hideConfigPassword = true;
  bool hideConfirmPassword = true;

  int jeniskelaminValue = 0;

  TextEditingController namaController = TextEditingController();
  TextEditingController whatssapController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController configpassController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

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

  changeConfirmPasswordVisibility() {
    setState(() {
      hideConfirmPassword = !hideConfirmPassword;
    });
  }

  late RegistrasiCubit _registerCubit;
  @override
  void initState() {
    super.initState();
    _registerCubit = RegistrasiCubit(RegistrasiRepositoryImpl());
  }

  @override
  void dispose() {
    _registerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocConsumer<RegistrasiCubit, RegistrasiState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RegistrasiIsError) {
            Commons().showSnackbarError(context, 'Registrasi Gagal');
          } else if (state is RegistrasiIsSucces) {
            Commons().showSnackbarInfo(context, "Registrasi Berhasil");
            context.go('/LoginScreen');
          }
        },
        builder: (context, state) {
          if (state is RegistrasiIsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return SingleChildScrollView(
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
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Ayo daftar sekarang untuk mengumpulkan koin \n penjemputan sampah!',
                      style: TextStyle(
                          fontSize: 14, color: Colors.white, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 652,
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
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                              'Jenis Kelamin',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                value: 1,
                                groupValue: jeniskelaminValue,
                                title: const Text("Pria"),
                                onChanged: (value) {
                                  setState(() {
                                    jeniskelaminValue = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                value: 2,
                                groupValue: jeniskelaminValue,
                                title: const Text("Wanita"),
                                onChanged: (value) {
                                  setState(() {
                                    jeniskelaminValue = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 16),
                            child: Text(
                              'Password',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
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
                                      color: Color(0xff72777F),
                                      (hidePassword)
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    )),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: 36,
                            child: TextFormField(
                              controller: configpassController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: hideConfirmPassword,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      changeConfirmPasswordVisibility();
                                    },
                                    child: Icon(
                                      color: Color(0xff72777F),
                                      (hideConfirmPassword)
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    )),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Confirm Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF7F33),
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: isProfileCompleted()
                                  ? () {
                                      context
                                          .read<RegistrasiCubit>()
                                          .btnRegisteer(RegisterRequest(
                                            namaController.text,
                                            whatssapController.text,
                                            emailController.text,
                                            jeniskelaminValue,
                                            passwordController.text,
                                            confirmController.text,
                                          ));
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
                              style: TextStyle(
                                  color: Color(0xFFFF7F33),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
