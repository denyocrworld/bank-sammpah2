part of '../pages.dart';

class PenjemputanScreen extends StatefulWidget {
  const PenjemputanScreen({super.key});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen> {
  var _image;
  var imagePicker;
  var type;

  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  TextEditingController lokasiController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController jamController = TextEditingController();
  TextEditingController menitController = TextEditingController();

  String? groupValue;

  bool isProfileCompleted() {
    if (lokasiController.text.isNotEmpty && tanggalController.text.isNotEmpty
        // waktuController.text.isNotEmpty &&
        // beratController.text.isNotEmpty
        ) {
      return true;
    } else {
      return false;
    }
  }

  DateTime pickDate = DateTime.now();
  // String formatDate = DateFormat.yMMMEd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Detail Penjemputan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
            onTap: () {
              context.go("/LayananScreen");
            },
            child: Icon(CupertinoIcons.arrow_left, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 26, left: 20),
                child: Text(
                  'Atur Lokasi',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 36,
                child: TextFormField(
                  controller: lokasiController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    suffixIcon: const Icon(Icons.location_on),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Atur lokasi penjemputan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 20),
                child: Text(
                  "Tanggal Penjemputan",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 36,
                child: TextFormField(
                  readOnly: true,
                  controller: tanggalController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        await showDatePicker(
                                context: context,
                                initialDate: pickDate,
                                firstDate: DateTime(1800),
                                lastDate: DateTime(2100))
                            .then((value) {
                          if (value != null)
                            setState(() {
                              pickDate = value;
                            });
                        });
                        if (pickDate != null) {
                          String dateFormat =
                              DateFormat("dd/MM/yyyy").format(pickDate);
                          tanggalController.text = dateFormat.toString();
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "dd/mm/yy",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20),
              child: Text('Pilih Waktu', style: TextStyle(fontSize: 14)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: TextFormField(
                      controller: jamController,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setState(() {
                          var intValue = int.tryParse(value) ?? 0;
                          // var value = 0;
                          if (intValue < 01) {
                            intValue = 01;
                          } else if (intValue > 12) {
                            intValue = 12;
                            jamController.text = intValue.toString();
                          }
                        });
                        if (value.length == 2) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: '00',
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
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 6),
                  child: Text(
                    ":",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 6),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: TextFormField(
                      controller: menitController,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setState(() {
                          var intValue = int.tryParse(value) ?? 0;
                          // var value = 0;
                          if (intValue < 00) {
                            intValue = 00;
                          } else if (intValue > 59) {
                            intValue = 59;
                            menitController.text = intValue.toString();
                          }
                        });
                        if (value.length == 2) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: '00',
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
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: "AM",
                    groupValue: groupValue,
                    title: const Text("AM"),
                    controlAffinity: ListTileControlAffinity.platform,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: "PM",
                    groupValue: groupValue,
                    title: const Text("PM"),
                    controlAffinity: ListTileControlAffinity.platform,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Berat dan bentuk sampah",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14, color: Colors.black),
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
                        hintText: '00',
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
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 5,
                  ),
                  child: Text(
                    "Kg",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return SizedBox(
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () async {
                                    image = await picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50);
                                    setState(() {
                                      //update UI
                                      _image = File(image!.path);
                                    });
                                  },
                                  child: ListTile(
                                    leading:
                                        Icon(CupertinoIcons.photo_on_rectangle),
                                    title: Text(
                                      "Gallery",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    image = await picker.pickImage(
                                        source: ImageSource.camera,
                                        imageQuality: 50);
                                    setState(() {
                                      _image = File(image!.path);
                                    });
                                  },
                                  child: ListTile(
                                    leading:
                                        Icon(CupertinoIcons.photo_camera_solid),
                                    title: Text(
                                      "Camera",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  // async {
                  //   image = await picker.pickImage(source: ImageSource.gallery);
                  //   setState(() {
                  //     //update UI
                  //     _image = File(image!.path);
                  //   });
                  // },
                  // child: _image != null
                  //     ? Image.file(_image,
                  //         height: 125.0,
                  //         width: MediaQuery.of(context).size.width,
                  //         fit: BoxFit.fill)
                  child: _image != null
                      ? Image.file(_image,
                          height: 125.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill)
                      : Container(
                          height: 125.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/sampah.png'),
                                fit: BoxFit.fill),
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                        )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80, left: 20),
                    child: Text(
                      "Total Biaya",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80, right: 20),
                      child: Text(
                        "Rp. 25,000",
                        style:
                            TextStyle(fontSize: 22.0, color: Color(0xFF019BF1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF8D50),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Proses Penjemputan"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
