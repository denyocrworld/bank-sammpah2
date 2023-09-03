

import 'package:flutter/material.dart';
import 'package:loginandsignup/presention/pages/home/home_page.dart';
import 'package:loginandsignup/presention/pages/pages.dart';

class NavigasiBar extends StatefulWidget {
  final int indexScreen;
  const NavigasiBar({
    Key? key,
    required this.indexScreen,
  }) : super(key: key);

  @override
  State<NavigasiBar> createState() => _NavigasiBarState();
}

class _NavigasiBarState extends State<NavigasiBar> {
  final _authCubit = AuthCubit();
  int navigasiBar = 0;
  final screen = [
    const HomeScreen(),
    const Profile(),
  ];
  @override
  void initState() {
    _authCubit.checkToken();
    navigasiBar = widget.indexScreen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state == AuthState.unauthenticated) {
            context.go('/');
          } else if (state == AuthState.tokenExpired) {
            // context.read<RefreshTokenCubit>().refreshToken();
            context.goNamed(Routes.HomeScreen);
          }
        },
        child: Scaffold(
          body: screen[navigasiBar],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigasiBar,
            onTap: (index) {
              context.read<AuthCubit>().checkToken();
              BlocProvider.of<AuthCubit>(context).checkToken();
              setState(() {
                navigasiBar = index;
              });
            },
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
        ));
  }
}
