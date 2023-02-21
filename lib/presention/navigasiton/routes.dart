import 'package:go_router/go_router.dart';
// import 'package:loginandsignup/pages/pages.dart';
import 'package:loginandsignup/presention/pages/pages.dart';

final GoRouter router = GoRouter(initialLocation: "/Penjemputan", routes: [
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
    path: "/AutentikasiScreen",
    name: "auten",
    builder: (context, state) => AutentikasiScreen(),
  ),
  GoRoute(
    path: "/SuccesScreen",
    name: "succes",
    builder: (context, state) => SuccesScreen(),
  ),
  GoRoute(
    path: "/HomeScreen",
    name: "homescreen",
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: "/RegisterScreen",
    name: "resgis",
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: "/NavigasiBar",
    name: "navbar",
    builder: (context, state) => NavigasiBar(),
  ),
  GoRoute(
    path: "/LupaPassword",
    name: "lupa",
    builder: (context, state) => LupaPassword(),
  ),
  GoRoute(
    path: "/ConfigPass",
    name: "configpass",
    builder: (context, state) => ConfigPass(),
  ),
  GoRoute(
    path: "/SuccesPass",
    name: "succespass",
    builder: (context, state) => SuccesPass(),
  ),
  GoRoute(
    path: "/BankSampahScreen",
    name: "bank",
    builder: (context, state) => BankSampahScreen(),
  ),
  GoRoute(
    path: "/TukarPoint1",
    name: "point1",
    builder: (context, state) => TukarPoint1(),
  ),
  GoRoute(
    path: "/Penjemputan",
    name: "penjemputan",
    builder: (context, state) => PenjemputanScreen(),
  ),
]);
