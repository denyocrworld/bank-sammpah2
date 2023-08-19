part of '../pages.dart';

class PilihPembayaranScreen extends StatefulWidget {
  const PilihPembayaranScreen({super.key});

  @override
  State<PilihPembayaranScreen> createState() => _PilihPembayaranScreenState();
}

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots')
];
class _PilihPembayaranScreenState extends State<PilihPembayaranScreen> {
  String? jenispembayaranValue;
  final List<bool> _selectedVegetables = <bool>[false, true, false];
  bool isTunai = false;
  bool isBank = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Pilih Pembayaran",
          style: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
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
          child: Padding(
            padding: const EdgeInsets.only(left:15, right: 15),
              child : Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      setState(()
                        {
                          isTunai = !isTunai;
                        }); 
                    },
                    child: 
                    Column(
                      children: [
                        Row(children: [
                          Text('Pembayaran Tunai', style: TextStyle(fontSize: 14, color : Color(0xff525252))),
                          Icon((isTunai == false) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Color(0xff525252)),
                        ],),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      (isTunai == false) ?
                        Row(
                          children: [
                            Padding(padding: const EdgeInsets.only(top: 8))
                          ],
                        ) 
                      : 
                        Column(
                          children:[
                            Row(
                              children : [ 
                                  Container(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width*0.94, //320, //MediaQuery.of(context).size.width,
                                    decoration : BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                    child : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex : 1,
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'asset/images/Logo_BCA.png'),
                                              ),
                                              Padding(padding: const EdgeInsets.only(right: 8,),),
                                              Text ( 'Tunai', style: TextStyle(fontSize: 14),),
                                            ]
                                          ),
                                        ),
                                        Flexible(
                                          flex : 2,
                                          child: Radio(
                                              value: "Tunai",
                                              groupValue: jenispembayaranValue,
                                              // title: const Text("Pria"),
                                              onChanged: (value) {
                                                setState(() {
                                                  jenispembayaranValue = value;
                                                });
                                              },
                                            ),
                                          // child : Text( 'BCA', style: TextStyle(fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),  
                                ),
                              ]
                            ),
                            Padding(padding: const EdgeInsets.only(top: 8,),),           
                          ]
                        ),
                    ],
                  ),    
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      setState(()
                        {
                          isBank = !isBank;
                        }); 
                    },
                    child: 
                    Column(
                      children: [
                        Row(children: [
                          Text('Bank Transfer', style: TextStyle(fontSize: 14, color : Color(0xff525252))),
                          Icon((isBank == false) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Color(0xff525252)),
                        ],),
                        
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      (isBank == false) ?
                        Row(
                          children: [
                            Padding(padding: const EdgeInsets.only(top: 8))
                          ],
                        ) 
                      : 
                        Column(
                          children:[
                            Row(
                              children : [ 
                                  Container(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width*0.94, //320, //MediaQuery.of(context).size.width,
                                    decoration : BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                    child : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex : 1,
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'asset/images/Logo_BCA.png'),
                                              ),
                                              Padding(padding: const EdgeInsets.only(right: 8,),),
                                              Text ( 'BCA', style: TextStyle(fontSize: 14),),
                                            ]
                                          ),
                                        ),
                                        Flexible(
                                          flex : 2,
                                          child: Radio(
                                              value: "BCA",
                                              groupValue: jenispembayaranValue,
                                              // title: const Text("Pria"),
                                              onChanged: (value) {
                                                setState(() {
                                                  jenispembayaranValue = value;
                                                });
                                              },
                                            ),
                                          // child : Text( 'BCA', style: TextStyle(fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),  
                                ),
                              ]
                            ),
                            Padding(padding: const EdgeInsets.only(top: 8,),),
                            Row(
                              children : [ 
                                  Container(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width*0.94, //320, //MediaQuery.of(context).size.width,
                                    decoration : BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                    child : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex : 1,
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'asset/images/Logo_BNI.png'),
                                              ),
                                              Padding(padding: const EdgeInsets.only(right: 8,),),
                                              Text ( 'BNI', style: TextStyle(fontSize: 14),),
                                            ]
                                          ),
                                        ),
                                        Flexible(
                                          flex : 2,
                                          child: Radio(
                                              value: "BNI",
                                              groupValue: jenispembayaranValue,
                                              // title: const Text("Pria"),
                                              onChanged: (value) {
                                                setState(() {
                                                  jenispembayaranValue = value;
                                                });
                                              },
                                            ),
                                          // child : Text( 'BCA', style: TextStyle(fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),  
                                ),
                              ]
                            ),
                            Padding(padding: const EdgeInsets.only(top: 8,),),
                            Row(
                              children : [ 
                                  Container(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width*0.94, //320, //MediaQuery.of(context).size.width,
                                    decoration : BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                    child : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex : 1,
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'asset/images/Logo_BRI.png'),
                                              ),
                                              Padding(padding: const EdgeInsets.only(right: 8,),),
                                              Text ( 'BRI', style: TextStyle(fontSize: 14),),
                                            ]
                                          ),
                                        ),
                                        Flexible(
                                          flex : 2,
                                          child: Radio(
                                              value: "BRI",
                                              groupValue: jenispembayaranValue,
                                              // title: const Text("Pria"),
                                              onChanged: (value) {
                                                setState(() {
                                                  jenispembayaranValue = value;
                                                });
                                              },
                                            ),
                                          // child : Text( 'BCA', style: TextStyle(fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),  
                                ),
                              ]
                            ),
                            Padding(padding: const EdgeInsets.only(top: 8,),),
                            Row(
                              children : [ 
                                  Container(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width*0.94, //320, //MediaQuery.of(context).size.width,
                                    decoration : BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                    child : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex : 1,
                                          child: Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'asset/images/Logo_Mandiri.png'),
                                              ),
                                              Padding(padding: const EdgeInsets.only(right: 8,),),
                                              Text ( 'Mandiri', style: TextStyle(fontSize: 14),),
                                            ]
                                          ),
                                        ),
                                        Flexible(
                                          flex : 2,
                                          child: Radio(
                                              value: "BNI",
                                              groupValue: jenispembayaranValue,
                                              // title: const Text("Pria"),
                                              onChanged: (value) {
                                                setState(() {
                                                  jenispembayaranValue = value;
                                                });
                                              },
                                            ),
                                          // child : Text( 'BCA', style: TextStyle(fontSize: 14),),
                                        ),
                                      ],
                                    ),
                                  ),  
                                ),
                              ]
                            ),           
                          ]
                        ),
                    ],
                  ), 
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 0, right: 0),
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
                        onPressed: () {
                                context.go('/KonfirmasiPembayaran');
                              },
                        child: const Text("Bayar Sekarang"),
                      ),
                    ),
                  ),    
                ]
              ),
          ),
        )
      ),  
    );
  }
}