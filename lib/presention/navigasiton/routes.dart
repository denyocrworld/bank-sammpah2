import 'package:go_router/go_router.dart';
import '../../pages/pages.dart';
import '../../screen/splash_screen.dart';

final GoRouter router = GoRouter(initialLocation: "/HomeScreen", routes: [
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
  ),
  GoRoute(
    path: "/HomeScreen",
    name: "homescreen",
    builder: (context, state) => HomeScreen(),
  )
]);
