part of '../pages.dart';

class Item {
  String? itemName;
  int? value;
  int? count;
  int? tPoint;

  Item({this.itemName, this.value, this.count = 0, this.tPoint = 0});
}

var itemPlastik = Item(itemName: 'plastik', value: 100, count: 0, tPoint: 0);
var itemKaca = Item(itemName: 'beling', value: 200, count: 0, tPoint: 0);
var itemBesi = Item(itemName: 'besi', value: 300, count: 0, tPoint: 0);
var itemKertas = Item(itemName: 'karton', value: 400, count: 0, tPoint: 0);

class BankSampahScreen extends StatefulWidget {
  const BankSampahScreen({super.key});

  @override
  State<BankSampahScreen> createState() => _BankSampahScreenState();
}

class _BankSampahScreenState extends State<BankSampahScreen> {
  int point = 0;
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    items = [itemPlastik, itemKaca, itemBesi, itemKertas];
  }

  @override
  void dispose() {
    for (var item in items) {
      item.count = 0;
      item.tPoint = 0;
    }
    super.dispose();
  }

  //cara 1 -----------------------------------------------
  // List<Item> item = [item1, item2, item3, item4];
  void grow1(index, name) {
    print(items[index].count);
    setState(() {
      items[index!].count = items[index].count! + 1;
      items[index!].tPoint = items[index].count! * items[index].value!;
    });
    print(items[index].count);
    var allPoint = items.fold(0, (sum, e) => sum + e.tPoint!);
    setState(() {
      point = allPoint;
    });
  }

  void decrease(int index) {
    setState(() {
      if (items[index].count! > 0) {
        items[index].count = items[index].count! - 1;
        point = point - items[index].value!;
      }
    });
    // setState(() {
    //   point = point - items[index].value!;
    // });
  }

  //cara 2 -----------------------------------------------
  List<dynamic> size = [
    {'Platik': 0},
    {'Kaca/Beling': 0},
    {'Kaleng/Besi': 0},
    {'Kertas/Karton': 0}
  ];

  void grow(index, item) {
    setState(() {
      size[index][item] += 1;
    });
//     print(index);
  }

  void decreament(index, item) {
    setState(() {
      size[index][item] -= 1;
    });
//     print(index);
  }

  bool _isRadioSelected = false;
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "Plastik",
      "Kaca/Beling",
      "Kaleng/Besi",
      "Kertas/Karton"
    ];
    List<String> image = [
      "asset/images/botol_plastik.png",
      "asset/images/botol_kaca.png",
      "asset/images/botol_kaleng.png",
      "asset/images/kertas.png"
    ];
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
                context.go("/NavigasiBar");
              },
              child: const Icon(CupertinoIcons.arrow_left,
                  color: Color(0xFF001F29)))),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
                child: Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFF5F5F5),
                      border: Border.all(color: Colors.grey, width: 0.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Poin anda :",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "25.000",
                            style: TextStyle(
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
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  "Jumlah Sampah",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
                ),
              ),
              BlocConsumer<BankSampahCubit, BankSampahState>(
                  listener: (context, state) {
                if (state is BankSampahIsSuccess) {
                  for (var element in state.data.bank_sampah) {
                    switch (element.point) {
                      case 1:
                        itemPlastik.value = element.point;
                        break;
                      case 2:
                        itemKaca.value = element.point;
                        break;
                      case 3:
                        itemBesi.value = element.point;
                        break;
                      case 4:
                        itemKertas.value = element.point;
                        break;
                    }
                  }
                }
              }, builder: (context, state) {
                if (state is BankSampahIsLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                } else if (state is BankSampahIsSuccess) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.data.bank_sampah.length,
                    itemBuilder: (context, index) {
                      final data = state.data.bank_sampah[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Container(
                          height: 75,
                          // width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFDFF),
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
                                  image[index],
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    data.layanan,
                                    style: const TextStyle(
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
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 5),
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
                                            heroTag: null,
                                            onPressed: () {
                                              decrease(index);
                                            },
                                            backgroundColor: const Color(0xFFFF7F33),
                                            child: const Icon(
                                              CupertinoIcons.minus,
                                              size: 30.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 22, right: 22),
                                        child: Text(
                                          "${items[index].count}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: FittedBox(
                                            child: FloatingActionButton(
                                              heroTag: null,
                                              onPressed: () {
                                                grow1(index,
                                                    items[index].itemName!);
                                              },
                                              backgroundColor:
                                                  const Color(0xFFFF7F33),
                                              child: const Icon(
                                                CupertinoIcons.plus,
                                                size: 30.0,
                                                color: Colors.white,
                                              ),
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
                      );
                    },
                  );
                }
                return Container();
              }),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total point yang didapat :",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '$point',
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF019BF1)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10.0),
                child: LinkedLabelRadio(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10.0),
                child: LinkedLabelRadio(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7F33),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      context.go("/SampahPenjemputan");
                    },
                    child: const Text("Selanjutnya"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
