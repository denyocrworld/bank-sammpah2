part of '../pages.dart';

class TukarPoint1 extends StatefulWidget {
  const TukarPoint1({super.key});

  @override
  State<TukarPoint1> createState() => _TukarPoint1State();
}

class _TukarPoint1State extends State<TukarPoint1> {
  TextEditingController tokenController = TextEditingController();
  TextEditingController namaTokenController = TextEditingController();
  TextEditingController nomorTokenController = TextEditingController();
  TextEditingController nominalTokenController = TextEditingController();

  TextEditingController BPJSController = TextEditingController();
  TextEditingController namaBPJSController = TextEditingController();
  TextEditingController nomorBPJSController = TextEditingController();
  TextEditingController nominalBPJSController = TextEditingController();

  late TukarpointCubit _tukarpointCubit;

  @override
  void initState() {
    super.initState();
    _tukarpointCubit = TukarpointCubit(TukarPointRepositoryImpl());
  }

  @override
  void dispose() {
    _tukarpointCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        title: const Text('Tukar Point',
            style: TextStyle(
                color: Color(0xFF001F29), fontWeight: FontWeight.w500)),
        leading: GestureDetector(
          onTap: () {
            context.go('/BankSampahScreen');
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: BlocBuilder<TukarpointCubit, TukarpointState>(
        builder: (context, tukarpointState) {
          if (tukarpointState is TukarpointIsSuccess) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Point anda :",
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "${tukarpointState.data.point}",
                              style: TextStyle(
                                  fontSize: 22.0, color: Color(0xFF019BF1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // final item = _item[index];
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 15, right: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffCEE5FF)),
                                borderRadius: BorderRadius.circular(16)),
                            child: RoundedExpansionTile(
                              title: Text(
                                "Rekening Bank",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              leading: Image(
                                image: AssetImage('asset/images/Bankkk.png'),
                                width: 50,
                                height: 50,
                              ),
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/BANK_BRI_logo.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Bank BRI",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Bank_BCA.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Bank BCA",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Bank_Mandiri.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Mandiri",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Bank_BNI.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Bank BNI",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/BTPN.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Bank BTPN",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Bank_Permata.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Permata",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/BSI.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Bank BSI",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Bank.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Bank Lain",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // final item = _item[index];
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffCEE5FF)),
                                borderRadius: BorderRadius.circular(16)),
                            child: RoundedExpansionTile(
                              title: Text(
                                "Dompet Elektronik",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              leading: Image(
                                image: AssetImage('asset/images/dompet.png'),
                                width: 50,
                                height: 50,
                              ),
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Ovo.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "OVO",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/gopay.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Gopay",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/dana.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Dana",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/link_aja.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Link Aja",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // final item = _item[index];
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffCEE5FF)),
                                borderRadius: BorderRadius.circular(16)),
                            child: RoundedExpansionTile(
                              title: Text(
                                "Pulsa/Paket Data",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              leading: Image(
                                image: AssetImage('asset/images/pulsa.png'),
                                width: 50,
                                height: 50,
                              ),
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/xl.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "XL",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/telkomsel.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Telkomsel",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/indosat.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Indosat",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                        'asset/images/tri.png',
                                                      ),
                                                      height: 50,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Tri",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // final item = _item[index];
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffCEE5FF)),
                                borderRadius: BorderRadius.circular(16)),
                            child: RoundedExpansionTile(
                              title: Text(
                                "Token Listrik PLN",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              leading: Image(
                                image: AssetImage('asset/images/token.png'),
                                width: 50,
                                height: 50,
                              ),
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          //  Padding(
                                          //         padding: const EdgeInsets.only(top: 16)
                                          //   ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Tarik ke',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                enabled: false,
                                                controller: tokenController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "Token PLN",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nama Pemilik atau pelanggan',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                controller: namaTokenController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(
                                                          RegExp("[a-zA-Z]")),
                                                ],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText:
                                                      "Isi nama lengkapmu",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nomor Pelanggan',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                controller:
                                                    nomorTokenController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "123456789",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nominal Point Ditarik',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                controller:
                                                    nominalTokenController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "Rp",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // final item = _item[index];
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffCEE5FF)),
                                borderRadius: BorderRadius.circular(16)),
                            child: RoundedExpansionTile(
                              title: Text(
                                "BPJS",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              leading: Image(
                                image: AssetImage('asset/images/bpjs.png'),
                                width: 50,
                                height: 50,
                              ),
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Tarik ke',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                enabled: false,
                                                controller: BPJSController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "BPJS",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nama Pemilik atau pelanggan',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                controller: namaBPJSController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(
                                                          RegExp("[a-zA-Z]")),
                                                ],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText:
                                                      "Isi nama lengkapmu",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nomor BPJS',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                controller: nomorBPJSController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "123456789",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16)),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nominal Point Ditarik',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.87,
                                              child: TextFormField(
                                                controller:
                                                    nominalBPJSController,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "Rp",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // final item = _item[index];
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffCEE5FF)),
                                borderRadius: BorderRadius.circular(16)),
                            child: RoundedExpansionTile(
                              title: Text(
                                "Toko LESTAREE",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              trailing: Icon(Icons.keyboard_arrow_down),
                              leading: Image(
                                image: AssetImage('asset/images/toko.png'),
                                width: 50,
                                height: 50,
                              ),
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/Ovo.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "OVO",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/gopay.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Gopay",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/dana.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Dana",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFF9FAFB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'asset/images/link_aja.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Link Aja",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (tukarpointState is TukarpointIsLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: Text(
              "Kosong",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
