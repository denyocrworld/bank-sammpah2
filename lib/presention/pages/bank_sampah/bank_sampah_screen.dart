part of '../pages.dart';

class BankSampahScreen extends StatefulWidget {
  const BankSampahScreen({super.key});

  @override
  State<BankSampahScreen> createState() => _BankSampahScreenState();
}

class _BankSampahScreenState extends State<BankSampahScreen> {
  bool _isRadioSelected = false;
  String? groupValue;

  // int _counter = 0;

  // tambah() {
  //   setState(() {
  //     _counter >= 0 ? _counter++ : null;
  //   });
  // }

  // kurang() {
  //   setState(() {
  //     _counter >= 1 ? _counter-- : null;
  //   });
  // }

  CounterBloc bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose();
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
          title: const Text('Bank Sampah',
              style: TextStyle(
                  color: Color(0xFF001F29), fontWeight: FontWeight.w500)),
          leading: GestureDetector(
              onTap: () {
                context.go("/HomeScreen");
              },
              child: const Icon(CupertinoIcons.arrow_left,
                  color: Color(0xFF001F29)))),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
              child: Container(
                height: 64,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFF5F5F5),
                    border: Border.all(color: Colors.grey, width: 0.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text(
                        "Poin anda :",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Expanded(
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "25.000",
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF019BF1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 100,
                        height: 32,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7F33),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            context.go('/TukarPoint1');
                          },
                          child: const Text(
                            "Tukar Point",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 24),
              // ignore: prefer_const_constructors
              child: Text(
                "Jumlah Sampah",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFDFF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        "asset/images/botol_plastik.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Plastik",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Berat/KG",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5A5F66)),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    bloc.inputan3.add('minus3');
                                  },
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Color(0xFFFF7F33),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: StreamBuilder(
                                stream: bloc.output3,
                                initialData: bloc.counter3,
                                builder: (context, snapshot) => Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      bloc.inputan3.add('add3');
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xFFFF7F33),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFDFF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        "asset/images/botol_kaca.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Kaca/Beling",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Berat/KG",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5A5F66)),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    bloc.inputan.add('minus');
                                  },
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Color(0xFFFF7F33),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: StreamBuilder(
                                stream: bloc.output,
                                initialData: bloc.counter,
                                builder: (context, snapshot) => Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      bloc.inputan.add('add');
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xFFFF7F33),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFDFF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        "asset/images/botol_kaleng.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Kaleng/Besi",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Berat/KG",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5A5F66)),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    bloc.inputan1.add('minus1');
                                  },
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Color(0xFFFF7F33),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: StreamBuilder(
                                stream: bloc.output1,
                                initialData: bloc.counter1,
                                builder: (context, snapshot) => Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      bloc.inputan1.add('add1');
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xFFFF7F33),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Container(
                height: 75,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFDFF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        "asset/images/kertas.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Kertas/Karton",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Berat/KG",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5A5F66)),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    bloc.inputan2.add('minus2');
                                  },
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Color(0xFFFF7F33),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: StreamBuilder(
                                stream: bloc.output2,
                                initialData: bloc.counter2,
                                builder: (context, snapshot) => Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      bloc.inputan2.add('add2');
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xFFFF7F33),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total point yang didapat :",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "12.000",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF019BF1)),
                  ),
                ],
              ),
            ),
            LinkedLabelRadio(
              label: 'Tukar di titik antar',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: false,
              groupValue: _isRadioSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _isRadioSelected = newValue;
                });
              },
            ),
            // Flexible(
            //   fit: FlexFit.loose,
            //   child: RadioListTile(
            //     value: "Tukar di titik antar",
            //     groupValue: groupValue,
            //     title: const Text("Atur titik penjemputan"),
            //     controlAffinity: ListTileControlAffinity.platform,
            //     onChanged: (value) {
            //       setState(() {
            //         groupValue = value;
            //       });
            //     },
            //   ),
            // ),

            LinkedLabelRadio(
              label: 'Tukar di titik antar (Drop Point)',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: true,
              groupValue: _isRadioSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _isRadioSelected = newValue;
                });
              },
            ),
            // Container(
            //   child: RadioListTile(
            //     value: "Tukar di titik antar (Drop Point)",
            //     groupValue: groupValue,
            //     title: const Text("Tukar di titik antar (Drop Point)"),
            //     controlAffinity: ListTileControlAffinity.platform,
            //     onChanged: (value) {
            //       setState(() {
            //         groupValue = value;
            //       });
            //     },
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
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
                  onPressed: () {},
                  child: const Text("Selanjutnya"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
