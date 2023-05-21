part of 'pages.dart';

class NavigasiBar extends StatefulWidget {
  const NavigasiBar({super.key});

  @override
  State<NavigasiBar> createState() => _NavigasiBarState();
}

class _NavigasiBarState extends State<NavigasiBar> {
  int navigasiBar = 0;
  final screen = [
    const HomeScreen(),
    // ProfileChange(),
    // Text(
    //   'Reward',
    //   style: TextStyle(fontSize: 36),
    //   textAlign: TextAlign.center,
    // ),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[navigasiBar],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigasiBar,
        onTap: (index) => setState(() => navigasiBar = index),
        backgroundColor: const Color(0xFF019BF1),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF00639C),
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Beranda',
          ),
          // ignore: prefer_const_constructors
          // BottomNavigationBarItem(
          //   icon: const Icon(CupertinoIcons.ticket),
          //   label: 'Reward',
          // ),
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
