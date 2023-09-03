// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loginandsignup/presention/pages/autentikasi/autentikasi.dart';
import 'package:loginandsignup/presention/pages/bank_sampah/cubit/bank_sampah_cubit.dart';
import 'package:loginandsignup/presention/pages/detail_riwayat/cubit/detal_history_cubit.dart';
import 'package:loginandsignup/presention/pages/home/cubit/home_cubit.dart';
import 'package:loginandsignup/presention/pages/home/home_page.dart';
import 'package:loginandsignup/presention/pages/login/login_screen.dart';
import 'package:loginandsignup/presention/pages/navigasibar.dart';
// import 'package:loginandsignup/pages/pages.dart';
import 'package:loginandsignup/presention/pages/pages.dart';
import '../pages/layanan/cubit/layanan_cubit.dart';
import '../pages/profile/userModel.dart';
import 'route.dart';
// import 'package:loginandsignup/presention/pages/pembayaran/cubit/pilih_pembayaran_cubit.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/Splash_Screen",
    name: "splash",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/",
    name: "login",
    builder: (context, state) => const LoginScreen(),
    // redirect: (context, state) async {
    //   final isAuth = context.read<AuthCubit>().checkToken();
    //   if (await isAuth) {
    //     return '/HomeScreen';
    //   } else {
    //     return '/';
    //   }
    // },
  ),
  // GoRoute(
  //   path: "/NavigasiBar",
  //   name: 'navbar',
  //   builder: (context, state) => const NavigasiBar(),
  // ),
  GoRoute(
    path: "/HomeScreen",
    name: Routes.HomeScreen,
    builder: (context, state) {
      BlocProvider.of<HomeCubit>(context).fecthHome();
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: "/Profile",
    name: Routes.Profile,
    builder: (context, state) => const Profile(),
  ),
  GoRoute(
    path: "/AutentikasiScreen",
    name: "auten",
    builder: (context, state) => const AutentikasiScreen(),
  ),
  GoRoute(
    path: "/SuccesScreen",
    name: "succes",
    builder: (context, state) => const SuccesScreen(),
  ),
  GoRoute(
      path: "/LayananScreen",
      name: "layanan",
      builder: (context, state) {
        BlocProvider.of<LayananCubit>(context).fecthLayanan();

        return const LayananScreen();
      }),
  GoRoute(
    path: "/RegisterScreen",
    name: "resgis",
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
      path: "/NavigasiBar",
      name: 'navbar',
      builder: (context, state) {
        BlocProvider.of<HomeCubit>(context).fecthHome();
        return const NavigasiBar();
      }),
  GoRoute(
    path: "/LupaPassword",
    name: "lupa",
    builder: (context, state) => const LupaPassword(),
  ),
  GoRoute(
    path: "/ConfigPass",
    name: "configpass",
    builder: (context, state) => const ConfigPass(),
  ),
  GoRoute(
    path: "/SuccesPass",
    name: "succespass",
    builder: (context, state) => const SuccesPass(),
  ),
  // GoRoute(
  //   path: "/LayananScreen",
  //   name: "layananscreen",
  //   builder: (context, state) => const SuccesPass(),
  // ),
  GoRoute(
    path: "/BankSampahScreen",
    name: "bank",
    builder: (context, state) {
      BlocProvider.of<BankSampahCubit>(context).fecthBankSampah();
      return const BankSampahScreen();
    },
  ),
  GoRoute(
    path: "/TukarPoint1",
    name: "point1",
    builder: (context, state) {
      // BlocProvider.of<TukarpointCubit>(context).fecthTukarPoint();
      return const TukarPoint1();
    },
  ),
  GoRoute(
      path: "/PenjemputanScreen",
      name: "penjemputan",
      builder: (context, state) {
        final service_name = state.extra as String;
        return PenjemputanScreen(
          service_name: service_name,
        );
      }),
  GoRoute(
    path: "/SampahPenjemputan",
    name: "sampahpenjemputan",
    builder: (context, state) => const SampahPenjemputan(),
  ),
  GoRoute(
    path: "/SuccessPenjemputan",
    name: "successpenjemputan",
    builder: (context, state) => const SuccessPenjemputan(),
  ),
  GoRoute(
    path: "/DetailRiwayat",
    name: "detailriwayat",
    builder: (context, state) {
      BlocProvider.of<DetalHistoryCubit>(context)
          .fecthDetailHistory("Detail History");
      return const DetailRiwayat();
    },
  ),
  GoRoute(
      path: "/RiwayatScreen",
      name: "riwayat",
      builder: (context, state) => const RiwayatScreen()),
  GoRoute(
    path: "/ArticleScreen",
    name: "article",
    builder: (context, state) => const ArticleScreen(),
  ),
  GoRoute(
    path: "/DetailArticle",
    name: "detailarticle",
    builder: (context, state) => const DetailArticle(),
  ),
  GoRoute(
    path: "/ChangeProfile",
    name: Routes.ChangeProfile,
    builder: (context, state) {
      BlocProvider.of<HomeCubit>(context).fecthHome();
      final _userModel = state.extra as UserModel;
      return ChangeProfile(profileData: _userModel);
    },
  ),
  GoRoute(
    path: "/KonfirmasiPembayaran",
    name: "KonfirmasiPembayaranScreen",
    builder: (context, state) => const KonfirmasiPembayaranScreen(),
  ),
  GoRoute(
    path: "/PilihPembayaran",
    name: "PilihPembayaranScreen",
    builder: (context, state) => const PilihPembayaranScreen(),
  ),
  GoRoute(
    path: "/UbahPasswordScreen",
    name: "ubahPasswordScreen",
    builder: (context, state) => const UbahPasswordScreen(),
  ),
]);
