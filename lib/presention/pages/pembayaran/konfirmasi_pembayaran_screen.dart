part of '../pages.dart';

class KonfirmasiPembayaranScreen extends StatefulWidget {
  const KonfirmasiPembayaranScreen({super.key});

  @override
  State<KonfirmasiPembayaranScreen> createState() => _KonfirmasiPembayaranScreenState();
}

class _KonfirmasiPembayaranScreenState extends State<KonfirmasiPembayaranScreen> with TickerProviderStateMixin  {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Konfirmasi Pembayaran",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            context.go('/PembayaranScreen');
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: 
      BlocListener<LoginCubit, LoginState>(
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
            
            child : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child : Text(
                      'Nomor Rekening Bank : ', style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child : Text(
                      '9016152139000', style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child : Text(
                      'Segera selesaikan pembayaran anda dalam waktu :', style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child : Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 100)),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 22, color: Colors.black),
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5)
                            ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 22, color: Colors.black),
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4)
                            ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                'm', style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15)
                            ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                ':', style: TextStyle(fontSize: 45, color: Color(0xFF019BF1), fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15)
                            ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 22, color: Colors.black),
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5)
                            ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 22, color: Colors.black),
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '0',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4)
                            ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                's', style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child : Text(
                      'Jika anda sudah melakukan pembayaran, maka akan terkonfirmasi secara otomatis', style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                    ),
                  ),  
                  Padding(
                    padding: const EdgeInsets.only(top: 24, right: 20, left: 20),
                    child : Column(
                      // resizeToAvoidBottomInset: false,
                      children: [ 
                        Container(
                        height: 49,
                        width: 320,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3FAFF),
                              border: Border.all(
                              color: const Color(0xFF019BF1),
                              width: 1.0,
                              style: BorderStyle.solid),
                              borderRadius: BorderRadius.only(topLeft : Radius.circular(10), topRight: Radius.circular(10)),),
                            child : 
                                Padding(
                                padding: const EdgeInsets.only(),
                                child: 
                                  TabBar(
                                    controller: _tabController,
                                    labelColor: Color(0xFFFFFFFF),
                                    unselectedLabelColor: Color(0xFF72777F),
                                    indicator : BoxDecoration( color: const Color(0xFF019BF1),),
                                    tabs: [
                                      Tab(
                                        child : Text( 'M-Banking', style: TextStyle(fontSize: 15,),),
                                      ),
                                      Tab(
                                        child : Text( 'KlikBCA', style: TextStyle(fontSize: 15,),),
                                      ),
                                      Tab(
                                        child : Text( 'ATM', style: TextStyle(fontSize: 15,),),
                                      ),
                                    ]
                                  ),
                                ),         
                        ),
                        Container(
                          height: 372,
                          width: 320, //320, //MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3FAFF),
                              border: Border.all(
                              color: const Color(0xFF019BF1),
                              width: 1.0,
                              style: BorderStyle.solid),
                              borderRadius: BorderRadius.only(bottomLeft : Radius.circular(10), bottomRight: Radius.circular(10)),),
                            child : 
                              TabBarView(
                                controller: _tabController,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'asset/images/Desc_Bank.png'),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'asset/images/Desc_Bank.png'),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'asset/images/Desc_Bank.png'),
                                  ),
                                  // Column(
                                  //   children : [Text( 'KlikBCA', style: TextStyle(fontSize: 18, color: Color(0xFF72777F),),),]
                                  // ),
                                  // Column(
                                  //   children : [Text( 'ATM', style: TextStyle(fontSize: 18, color: Color(0xFF72777F),),),]
                                  // ),
                                ]
                              ),
                              // Column(
                              //   children: [
                              //     Padding(
                              //     padding: const EdgeInsets.only(top: 20, left :10),
                              //     child: 
                              //       TabBarView(
                              //         controller: _tabController,
                              //         children: [
                              //           Column(
                              //             children : [Text( 'M-Banking', style: TextStyle(fontSize: 18, color: Color(0xFF72777F),),),]
                              //           ),
                              //           Column(
                              //             children : [Text( 'KlikBCA', style: TextStyle(fontSize: 18, color: Color(0xFF72777F),),),]
                              //           ),
                              //           Column(
                              //             children : [Text( 'ATM', style: TextStyle(fontSize: 18, color: Color(0xFF72777F),),),]
                              //           ),
                              //         ]
                              //       ),
                              //     ),  
                              //   ],
                              // ),
                        ),
                      ]
                    ),          
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}