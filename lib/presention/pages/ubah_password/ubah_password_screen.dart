part of '../pages.dart';

class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({super.key});

  @override
  State<UbahPasswordScreen> createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  bool hidePassword = true;

  TextEditingController passwordLamaController = TextEditingController();
  TextEditingController passwrordBaruConroller = TextEditingController();
  TextEditingController konfirmasiPasswrodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Lupa Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            context.go('/NavigasiBar');
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF001F29),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 26,
            left: 21,
            right: 21,
            bottom: 350,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffFCFCFF),
              border: Border.all(
                color: const Color(0xffC2C7CF),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 24, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Password Lama'),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 36,
                    width: MediaQuery.of(context).size.width * 1,
                    child: TextFormField(
                      controller: passwordLamaController,
                      keyboardType: TextInputType.multiline,
                      obscureText: hidePassword,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password Lama",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Password Baru'),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 36,
                    width: MediaQuery.of(context).size.width * 1,
                    child: TextFormField(
                      controller: passwrordBaruConroller,
                      keyboardType: TextInputType.multiline,
                      obscureText: hidePassword,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password Baru",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Konfirmasi Password'),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 36,
                    width: MediaQuery.of(context).size.width * 1,
                    child: TextFormField(
                      controller: konfirmasiPasswrodController,
                      keyboardType: TextInputType.multiline,
                      obscureText: hidePassword,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "081234567890",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7F33),
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
