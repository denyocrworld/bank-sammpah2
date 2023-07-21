part of '../pages.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFF5F5F5),
          centerTitle: true,
          title: const Text('Ubah Profil',
              style: TextStyle(
                  color: Color(0xFF001F29), fontWeight: FontWeight.w500)),
          leading: GestureDetector(
            onTap: () {
              context.go('/NavigasiBar');
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Color(0xFF001F29),
            ),
          ),
        ),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, loginState) {
            if (loginState is LoginIsError) {
              ((loginState.message == ""
                  ? Commons()
                      .showSnackbarError(context, "Username dan Password Salah")
                  : Commons().showSnackbarError(context, loginState.message!)));

              print(loginState.message);
            } else if (loginState is LoginSucces) {
              Commons().setUid("${loginState.data.token}");
              print("Token: ${loginState.data.token}");
              Commons().showSnackbarInfo(context, "Login Berhasil");
              context.go('/NavigasiBar');
            }
            // TODO: implement listener
          },
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
                  child: Container(
                    height: 456,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: Color(0xFFF8FCFF),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 16, right: 16),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Icon(
                                Icons.account_circle,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Text(
                                'Upload Gambar',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.camera,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 16, right: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nama',
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
                              controller: namaController,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "John Doe",
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
                              top: 8, left: 16, right: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Alamat',
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
                              controller: namaController,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Address",
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
                              top: 8, left: 16, right: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'No. Handphone',
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
                              controller: noController,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Email',
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
                              controller: emailController,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Example@email.com",
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
                              top: 24, left: 16, right: 16),
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
                              onPressed: () {},
                              child: const Text(
                                "Simpan",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          )),
        ));
  }
}
