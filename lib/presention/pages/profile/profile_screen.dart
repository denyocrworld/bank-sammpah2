part of '../pages.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          // body: BlocBuilder<HomeCubit, HomeState>(
          //   builder: (context, homeState) {
          // if (homeState is HomeIsSuccess) {
          Stack(
        children: <Widget>[
          ClipPath(
            clipper: Customshape(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 230,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 76, left: 20, right: 21),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: Color(0xFFF8FCFF),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 16, right: 16),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      'John Doe',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.go("/ChangeProfile");
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 38),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          'Jakarta',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          '081234567890',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          'Example@gmail.com',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text(
                                      'Saldo Anda :',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        'Rp. 12.000',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF019BF1)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: SizedBox(
                                      height: 31,
                                      width: 80,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFF7F33),
                                          shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Isi Saldo",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 0),
                      child: const Text('Riwayat',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 0),
                      child: TextButton(
                        onPressed: () {
                          context.go("/RiwayatScreen");
                        },
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Lihat semua',
                              style: const TextStyle(
                                  color: Color(0xFFFF7F33),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14,
                              color: const Color(0xFFFF7F33),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFDFF),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 0.1),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, left: 16),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    '12 Januari 2023',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: const Color(0xFFA7ABB3),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, right: 16),
                                  child: Text(
                                    '+150pt',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFA7ABB3),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 16),
                                  child: Text(
                                    'Berat Sampah :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF001F29),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 5),
                                    child: Text(
                                      '4kg',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF001F29),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    right: 16,
                                  ),
                                  child: Text(
                                    'Rp15.000',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF019BF1),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 16, left: 16),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Color(0xFFFF7F33)),
                                    foregroundColor: Color(0xFFFF7F33),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
                                    ),
                                  ),
                                  onPressed: () {
                                    context.go('/DetailRiwayat');
                                  },
                                  child: const Text("Lihat Detail",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    // } else if (homeState is HomeIsLoading) {
    //   return Container(
    //     alignment: Alignment.center,
    //     child: CircularProgressIndicator(),
    //   );
    // }
    // return Container(
    //   child: Text(
    //     "Kosong",
    //     style: TextStyle(
    //       fontSize: 10.0,
    //     ),
    //   ),
    // );
    //     }
    //   )
    // );
  }
}
