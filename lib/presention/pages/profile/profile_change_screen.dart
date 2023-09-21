// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, unused_local_variable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../pages.dart';

class ChangeProfile extends StatefulWidget {
  final UserModel profileData;
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
  TextEditingController nameController = TextEditingController(text: " ");
  TextEditingController addressController = TextEditingController(text: " ");
  TextEditingController phoneController = TextEditingController(text: " ");
  TextEditingController emailController = TextEditingController(text: " ");
  String urlImage = '';

  @override
  void initState() {
    super.initState();
    // namaController.text = widget.id.toString();
    BlocProvider.of<HomeCubit>(context).fecthHome();
    urlImage = widget.profileData.image;
    nameController.text = widget.profileData.name;
    emailController.text = widget.profileData.email;
    phoneController.text = widget.profileData.phone_number;
    addressController.text = widget.profileData.address;
    super.initState();
  }

  @override
  void dispose() {
    urlImage = widget.profileData.image;
    nameController.text = widget.profileData.name;
    emailController.text = widget.profileData.email;
    phoneController.text = widget.profileData.phone_number;
    addressController.text = widget.profileData.address;
    super.dispose();
  }

  bool isUpdating = false;
  File? image;
  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(
        () {
          image = File(pickedImage.path);
          urlImage = '';
        },
      );
    }
  }

  bool isUpdate = false;

  bool validate() {
    if (image == null) {
      Commons().showSnackbarError(context, 'Photo Profile Tidak Boleh Kosong');
      return false;
    }
    return true;
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
              context.goNamed(Routes.Profile);
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
              Commons().showSnackbarError(context, state.message!);
            } else if (state is ProfileChangeIsSuccess) {
              context.goNamed(Routes.Profile);
              //background: #578400; warna text pemberitahuan

              Commons().showSnackbarInfo(context, "Update Data Berhasil");

              // context.read<TokenCubit>().fecthRefreshToken();
              context.read<AuthCubit>().checkToken();
            }
          },
          child: isUpdating
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 26, left: 20, right: 20),
                        child: Container(
                          height: 500,
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
                                      child:

                                          // urlImage != ''
                                          //     ? CircleAvatar(
                                          //         backgroundImage: NetworkImage(urlImage),
                                          //         maxRadius: 50,
                                          //       )
                                          //     :

                                          CircleAvatar(
                                              maxRadius: 50,
                                              child: image != null
                                                  ? CircleAvatar(
                                                      maxRadius: 50,
                                                      backgroundImage: AssetImage(
                                                          'asset/images/user-circle.png'))
                                                  : CircleAvatar(
                                                      maxRadius: 50,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        widget
                                                            .profileData.image,
                                                      ),
                                                    )

                                              // Image.asset(
                                              //   "asset/images/user-circle.png",
                                              //   fit: BoxFit.contain)
                                              )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 17),
                                    child: Text(
                                      'Upload Gambar',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _getImageFromCamera();
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
                                    controller: nameController,
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: nameController.text,
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
                                    controller: addressController,
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: addressController.text,
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
                                    controller: phoneController,
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: phoneController.text,
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
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
                                      if (validate()) {
                                        setState(() {
                                          BlocProvider.of<ProfileChangeCubit>(
                                                  context)
                                              .fetchChangeProfile(
                                                  ProfileRequest(
                                            image!,
                                            nameController.text,
                                            emailController.text,
                                            phoneController.text,
                                            addressController.text,
                                          ));
                                        });
                                      }
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
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       top: 16, left: 16, right: 16),
                              //   child: SizedBox(
                              //     width: MediaQuery.of(context).size.width * 1,
                              //     height: 40,
                              //     child: OutlinedButton(
                              //       style: OutlinedButton.styleFrom(
                              //         side:
                              //             const BorderSide(color: Color(0xFFFF7F33)),
                              //         foregroundColor: const Color(0xFFFF7F33),
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(8), // <-- Radius
                              //         ),
                              //       ),
                              //       onPressed: () {
                              //         context.go('/UbahPasswordScreen');
                              //       },
                              //       child: const Text(
                              //         "Ubah Password",
                              //         style: TextStyle(
                              //             fontSize: 16, fontWeight: FontWeight.w400),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ))
                  ],
                )),
        ));
  }
}
