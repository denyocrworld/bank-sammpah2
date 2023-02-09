import 'package:go_router/go_router.dart';
import '../../pages/pages.dart';

final GoRouter router = GoRouter(initialLocation: "/LoginScreen", routes: [
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
]);
