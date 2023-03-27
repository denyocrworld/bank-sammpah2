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
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, loginState) {
          if (loginState is LoginIsError) {
            ((loginState.message == ""
                ? Commons()
                    .showSnackbarError(context, "Username dan Password Salah")
                : Commons().showSnackbarError(context, loginState.message!)));

            print(loginState.message);
          } else if (loginState is LoginIsSuccess) {
            Commons().setUid("${loginState.data.token}");
            print("Token: ${loginState.data.token}");
            Commons().showSnackbarInfo(context, "Login Berhasil");
            context.go('/HomeScreen');
          }
          // TODO: implement listener
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 132),
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
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Ayo kumpulkan koin penjemputan sampah!',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Container(
                  height: 440,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Color(0xFFF8FCFF),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
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
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: SizedBox(
                          height: 36,
                          width: MediaQuery.of(context).size.width * 1,
                          child: TextFormField(
                            controller: whatssapController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
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
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: SizedBox(
                          height: 36,
                          width: MediaQuery.of(context).size.width * 1,
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
                                    color: Color(0xff72777F),
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
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: SizedBox(
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
                                    BlocProvider.of<LoginCubit>(context)
                                        .LoginUser(whatssapController.text,
                                            passwordController.text);
                                  }
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
                        child: Text(
                          'Lupa Password?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFFF7F33),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Divider(
                                thickness: 2,
                                color: Color(0xffB3BCC5),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
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
                              padding: const EdgeInsets.only(right: 16),
                              child: Divider(
                                thickness: 2,
                                color: Color(0xffB3BCC5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 40,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFFFF7F33)),
                              foregroundColor: Color(0xFFFF7F33),
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
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
        ),
      ),
    );
  }
}
