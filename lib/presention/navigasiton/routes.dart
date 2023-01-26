import 'package:go_router/go_router.dart';
import 'package:loginandsignup/screen/home/homescreen.dart';
import 'package:loginandsignup/screen/login/login_screen.dart';
import 'package:loginandsignup/screen/registrasi/register_screen.dart';
import 'package:loginandsignup/screen/splash_screen.dart';

import '../../screen/autentifikasi/autentikasi.dart';
import '../../screen/autentifikasi/succes_screen.dart';

final GoRouter router = GoRouter(initialLocation: "/SuccesScreen", routes: [
  GoRoute(
    path: "/Splash_Screen",
    name: "splash",
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: "/LoginScreen",
    name: "login",
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: "/HomePage",
    name: "home",
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: "/RegisterScreen",
    name: "regis",
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: "/AutentikasiScreen",
    name: "auten",
    builder: (context, state) => AutentikasiScreen(),
  ),
  GoRoute(
    path: "/SuccesScreen",
    name: "succes",
    builder: (context, state) => SuccesScreen(),
  )
]);
