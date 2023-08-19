part of '../pages.dart';

class LayananScreen extends StatelessWidget {
  const LayananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Layanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
            onTap: () {
              context.go("/NavigasiBar");
            },
            child: const Icon(CupertinoIcons.arrow_left, color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    color: Colors.blue.shade50,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go("/PenjemputanScreen");
                                },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCEE5FF),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image(
                                      image: AssetImage(
                                          "asset/images/langganan.png")),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Langganan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    color: Colors.blue.shade50,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go("/PenjemputanScreen");
                                },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCEE5FF),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image(
                                      image: AssetImage(
                                          "asset/images/hajatan.png")),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Hajatan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    color: Colors.blue.shade50,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go("/PenjemputanScreen");
                                },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCEE5FF),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image(
                                      image: AssetImage(
                                          "asset/images/sekali_angkut.png")),
                                ),
                              ),
                            ],
                          ),
                          Text("Sekali Angkut",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    color: Colors.blue.shade50,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go("/PenjemputanScreen");
                                },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCEE5FF),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image(
                                      image: AssetImage(
                                          "asset/images/acara_lainnya.png")),
                                ),
                              ),
                            ],
                          ),
                          Text("Acara Lainnya",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
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
