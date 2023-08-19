part of '../pages.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({super.key});

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  TextEditingController whatssapController = TextEditingController();

  bool isProfileCompleted() {
    if (whatssapController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  late ForgotPassCubit _forgotpassCubit;

  @override
  void initState() {
    super.initState();
    _forgotpassCubit = ForgotPassCubit(ForgotPasswordRepositoryImpl());
  }

  @override
  void dispose() {
    _forgotpassCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocListener<ForgotPassCubit, ForgotPassState>(
        listener: (context, forgotPassState) {
          // TODO: implement listener
          if (forgotPassState is ForgotPassIsError) {
            Commons().showSnackbarError(context, forgotPassState.message);
          } else if (forgotPassState is ForgotPassIsSuccess) {
            Commons().showSnackbarInfo(context,
                "Email Berhasil Terkirim ke ${whatssapController.text}");
            context.go("/ConfigPass");
          }
        },
        child: Center(
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
                          'asset/images/kasek.png',
                          width: MediaQuery.of(context).size.width * 1,
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
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: SizedBox(
                          height: 36,
                          width: MediaQuery.of(context).size.width * 1,
                          child: TextFormField(
                            controller: whatssapController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Masukan disini",
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
                              backgroundColor: const Color(0xFFFF7F33),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: isProfileCompleted()
                                ? () {
                                    BlocProvider.of<ForgotPassCubit>(context)
                                        .btnForgotPass(ForgotPassword(whatssapController.text));
                                  }
                                : null,
                            child:
                                BlocBuilder<ForgotPassCubit, ForgotPassState>(
                              builder: (context, forgotPassState) {
                                if (forgotPassState is ForgotPassIsLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return const Text("Kirim Kode Konfirmasi");
                              },
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
