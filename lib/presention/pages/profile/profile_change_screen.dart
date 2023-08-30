// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../pages.dart';

class ChangeProfile extends StatefulWidget {
  final HomeProfileData profileData;
  // final int? id;
  const ChangeProfile({
    Key? key,
    // this.id,
    required this.profileData,
  }) : super(key: key);

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    // namaController.text = widget.id.toString();
    // namaController.text = widget.profileData.username;
    // alamatController.text = widget.profileData.address;
    // noController.text = widget.profileData.phone;
    // emailController.text = widget.profileData.email;
    BlocProvider.of<HomeCubit>(context).fecthHome();
    super.initState();
  }

  @override
  void dispose() {
    // namaController.text = widget.profileData.username;
    // alamatController.text = widget.profileData.address;
    // noController.text = widget.profileData.phone;
    // emailController.text = widget.profileData.email;
    super.dispose();
  }

  File? _image;

  Future<void> _getImageFromCamera(String? idRiwayat) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    // if (pickedImage != null) {
    //   setState(
    //     () {
    //       _image = File(pickedImage.path);
    //       context.goNamed(
    //         // Routes.uploadImageScreen,
    //         // extra: {
    //         //   'image': _image,
    //         //   'idRiwayat': idRiwayat,
    //         // },
    //       );
    //     },
    //   );
    // }
  }

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
        body: BlocListener<ProfileChangeCubit, ProfileChangeState>(
          listener: (context, state) {
            if (state is ProfileChangeIsError) {
              ((state.message == ""
                  ? Commons()
                      .showSnackbarError(context, "Username dan Password Salah")
                  : Commons().showSnackbarError(context, state.message!)));

              print(state.message);
            } else if (state is ProfileChangeIsSuccess) {
              namaController.text = state.data.profile.username;
              alamatController.text = state.data.profile.address;
              noController.text = state.data.profile.phone;
              emailController.text = state.data.profile.email;

              context.go('/NavigasiBar');
            }
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
                            Container(
                              padding: const EdgeInsets.only(left: 9),
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                radius: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Text(
                                'Upload Gambar',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  // _getImageFromCamera(
                                  //                   data.id.toString(),
                                  //                 );
                                  //                 context.pop();
                                },
                                icon: Icon(
                                  Icons.camera,
                                  size: 16,
                                  color: Colors.grey,
                                )),
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
                                hintText: namaController.text,
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
                              controller: alamatController,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: alamatController.text,
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
                                hintText: noController.text,
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
                                hintText: emailController.text,
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
                              onPressed: () {
                                context.read<ProfileChangeCubit>().btnLogin(
                                      ProfileRequest(
                                          imageController.text,
                                          namaController.text,
                                          noController.text,
                                          alamatController.text,
                                          emailController.text),
                                    );
                              },
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
