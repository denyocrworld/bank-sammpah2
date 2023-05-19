part of '../pages.dart';

class SampahPenjemputan extends StatefulWidget {
  const SampahPenjemputan({super.key});

  @override
  State<SampahPenjemputan> createState() => _SampahPenjemputanState();
}

class _SampahPenjemputanState extends State<SampahPenjemputan> {
  var _image;
  var imagePicker;
  var type;
  var _photo;

  String? groupValue;

  TextEditingController lokasiController = TextEditingController();
  TextEditingController penjemputandController = TextEditingController();
  TextEditingController jamController = TextEditingController();
  TextEditingController menitController = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? photo;
  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  DateTime pickDate = DateTime.now();

  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  void dispose() {
    jamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        centerTitle: true,
        title: Text(
          'Bank Sampah',
          style: TextStyle(
            color: Color(0xFF001F29),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            context.go('/BankSampahScreen');
          },
          child: Icon(
            CupertinoIcons.arrow_left,
            size: 20,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text('Atur Lokasi', style: TextStyle(fontSize: 14)),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: TextFormField(
                controller: lokasiController,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Atur lokasipen jemputan",
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
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child:
                  Text('Tanggal Penjemputan', style: TextStyle(fontSize: 14)),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: TextFormField(
                readOnly: true,
                controller: penjemputandController,
                keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 14, color: Colors.black),
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
                        penjemputandController.text = dateFormat.toString();
                      }
                    },
                    icon: const Icon(
                      Icons.date_range_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "dd/mm/yy",
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
                onChanged: (value) {},
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
                                  child: const ListTile(
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
                                  child: const ListTile(
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
                  //
                  //
                  child: _image != null
                      ? Image.file(_image,
                          height: 125.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill)
                      : Container(
                          height: 150.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/sampah.png'),
                                fit: BoxFit.cover),
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
                const Flexible(
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
                const Flexible(
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
                    backgroundColor: const Color(0xFFFF8D50),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    context.go("/SuccessPenjemputan");
                  },
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
