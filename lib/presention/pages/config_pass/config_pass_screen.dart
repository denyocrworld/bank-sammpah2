part of '../pages.dart';

class ConfigPass extends StatefulWidget {
  const ConfigPass({super.key});

  @override
  State<ConfigPass> createState() => _ConfigPassState();
}

class _ConfigPassState extends State<ConfigPass> {
  TextEditingController whatssapController = TextEditingController();
  bool isProfileCompleted() {
    if (whatssapController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  late ConfigPassCubit _configPassCubit;

  @override
  void initState() {
    super.initState();
    _configPassCubit = ConfigPassCubit(ConfigCodeRepositoryImpl());

    @override
    void dispose() {
      _configPassCubit.close();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocListener<ConfigPassCubit, ConfigPassState>(
        listener: (context, configPassState) {
          // TODO: implement listener
          if (configPassState is ConfigPassIsError) {
            Commons().showSnackbarError(context, 'Gagal');
          } else if (configPassState is ConfigPassIsSuccess) {
            Commons().showSnackbarInfo(context, "Terverifikasi");
            context.go('/SuccesPass');
          }
        },
        child: SingleChildScrollView(
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
                    height: 268,
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
                              child: Text('Masukan Kode Konfirmasi')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
                          child: SizedBox(
                            height: 36,
                            width: MediaQuery.of(context).size.width * 1,
                            child: TextFormField(
                              controller: whatssapController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Masukkan kode",
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
                                backgroundColor: Color(0xFFFF7F33),
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: isProfileCompleted()
                                  ? () {
                                      BlocProvider.of<ConfigPassCubit>(context)
                                          .btnConfirmCode(ConfirmCodeRequest(
                                              code: whatssapController.text));
                                    }
                                  : null,
                              child:
                                  BlocBuilder<ConfigPassCubit, ConfigPassState>(
                                builder: (context, configPassState) {
                                  if (configPassState is ConfigPassIsLoading) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return Text("Konfirmasi");
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16),
                          child: Row(
                            children: [
                              Text(
                                "Belum menerima kode?",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Kirim Ulang",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.blue),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
