part of '../pages.dart';

class SampahPenjemputan extends StatefulWidget {
  const SampahPenjemputan({super.key});

  @override
  State<SampahPenjemputan> createState() => _SampahPenjemputanState();
}

class _SampahPenjemputanState extends State<SampahPenjemputan> {
  String? groupValue;

  TextEditingController lokasiController = TextEditingController();
  TextEditingController penjemputandController = TextEditingController();
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
          ),
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
                style: TextStyle(fontSize: 14, color: Color(0xFF72777F)),
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
              child: Text('Detail Penjemputan', style: TextStyle(fontSize: 14)),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
              child: TextFormField(
                controller: penjemputandController,
                keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 14, color: Color(0xFF72777F)),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  suffixIcon: Icon(
                    Icons.date_range_outlined,
                    color: Colors.grey,
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
              child: Text('Detail Penjemputan', style: TextStyle(fontSize: 14)),
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
                      padding: const EdgeInsets.only(
                        top: 80,
                      ),
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
