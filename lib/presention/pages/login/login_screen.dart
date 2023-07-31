part of '../pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  TextEditingController whatssapController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = LoginCubit(LoginRepositoryImpl());
  }

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  bool isProfileCompleted() {
    if (whatssapController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is LoginIsError) {
              Commons().showSnackbarError(context, "Login Gagal");
            } else if (state is LoginSucces) {
              Commons().showSnackbarInfo(context, "Login Berhasil");
              context.go('/NavigasiBar');
            }
          },
          builder: (context, state) {
            if (state is LoginIsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 132),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Masuk Akun',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text('Ayo kumpulkan koin penjemputan sampah!',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: Container(
                      height: 440,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8FCFF),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: Image.asset(
                              'asset/images/kasek.png',
                              width: MediaQuery.of(context).size.width * 1,
                              height: 32,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16, left: 16),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Nomor Whatsapp/Email',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 16, right: 16),
                            child: SizedBox(
                              height: 36,
                              width: MediaQuery.of(context).size.width * 1,
                              child: TextFormField(
                                controller: whatssapController,
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          const Padding(
                            padding: EdgeInsets.only(top: 16, left: 16),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 16, right: 16),
                            child: SizedBox(
                              height: 36,
                              width: MediaQuery.of(context).size.width * 1,
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: hidePassword,
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        changePasswordVisibility();
                                      },
                                      child: Icon(
                                        color: const Color(0xff72777F),
                                        (hidePassword)
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      )),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF7F33),
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: isProfileCompleted()
                                    ? () {
                                        context.read<LoginCubit>().btnLogin(
                                            LoginRequest(
                                                whatssapController.text,
                                                passwordController.text));
                                      }
                                    // {
                                    //     BlocProvider.of<LoginCubit>(context)
                                    //         .btnLogin(LoginRequest(
                                    //             whatssapController.text,
                                    //             passwordController.text));
                                    //   }
                                    : null,
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/LupaPassword');
                            },
                            child: const Text(
                              'Lupa Password?',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFFF7F33),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Divider(
                                    thickness: 2,
                                    color: Color(0xffB3BCC5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Text(
                                  'Tidak Memiliki Akun ?',
                                  style: TextStyle(
                                      color: Color(0xFFB3BCC5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Divider(
                                    thickness: 2,
                                    color: Color(0xffB3BCC5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 40,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Color(0xFFFF7F33)),
                                  foregroundColor: const Color(0xFFFF7F33),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(8), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  context.go('/RegisterScreen');
                                },
                                child: const Text(
                                  "Daftar Akun",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
