part of '../pages.dart'; 

class PenjemputanScreen extends StatefulWidget{
  const PenjemputanScreen({super.key});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen>{

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
        leading: Icon(CupertinoIcons.arrow_left, color: Colors.black),
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
          ],
        ),
      ),
    );
  }

}