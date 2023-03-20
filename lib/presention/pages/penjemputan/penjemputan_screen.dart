part of '../pages.dart'; 

class PenjemputanScreen extends StatefulWidget{
  const PenjemputanScreen({super.key});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen>{

String? groupValue;

TextEditingController lokasiController = TextEditingController();
TextEditingController tanggalController = TextEditingController();

bool isProfileCompleted() {
    if (lokasiController.text.isNotEmpty &&
        tanggalController.text.isNotEmpty 
        // waktuController.text.isNotEmpty &&
        // beratController.text.isNotEmpty
        ) {
      return true;
    } else {
      return false;
    }
  }


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
            context.go('/LayananScreen');
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
              padding:
                  const EdgeInsets.only(top: 8, left: 20, right: 20),
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
                  'Tanggal Penjemputan',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 20, right: 20),
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
                    suffixIcon: const Icon(Icons.calendar_month),
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
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(top: 24, left: 20),
                    child: Text('Berat dan bentuk sampah', style: TextStyle(fontSize: 14)),
                  ),
                
                  ],
                ), 
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  padding: EdgeInsets.only(left: 8)
                ),
                Text("Kg"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: Container(
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
              ),
            ),
            Row(
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
                      padding: const EdgeInsets.only(top: 80),
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