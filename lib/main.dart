import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/repository/autentikasi/autentikasi_repository_impl.dart';
import 'package:loginandsignup/data/repository/change_profile/change_profile_repository_impl.dart';
import 'package:loginandsignup/data/repository/config-code/config_code_repository_impl.dart';
import 'package:loginandsignup/data/repository/detail_riwayat/detail_history_repository_impl.dart';
import 'package:loginandsignup/data/repository/forgot-password/forgot_password_repository.impl.dart';
import 'package:loginandsignup/data/repository/home/home_repository_impl.dart';
import 'package:loginandsignup/data/repository/layanan/layanan_repository_impl.dart';
import 'package:loginandsignup/data/repository/login/login_repository_impl.dart';
import 'package:loginandsignup/data/repository/registrasi/registrasi_repository_impl.dart';
import 'package:loginandsignup/data/repository/tukar_point/tukar_point_repository_impl.dart';
import 'package:loginandsignup/presention/navigasiton/routes.dart';
import 'package:loginandsignup/presention/pages/autentikasi/cubit/autentikasi_cubit.dart';
import 'package:loginandsignup/presention/pages/home/cubit/home_cubit.dart';
import 'package:loginandsignup/presention/pages/layanan/cubit/layanan_cubit.dart';
import 'package:loginandsignup/presention/pages/login/cubit/login_cubit.dart';
import 'package:loginandsignup/presention/pages/lupa_password/cubit/forgot_pass_cubit.dart';
import 'package:loginandsignup/presention/pages/registrasi/cubit/registrasi_cubit.dart';

import 'data/repository/new-inquiry/new_inquiry_impl.dart';
import 'data/repository/token/token_repository_impl.dart';
import 'data/utilities/auth_cubit.dart';
import 'data/utilities/token/cubit/token_cubit.dart';
import 'presention/pages/bank_sampah/cubit/bank_sampah_cubit.dart';
import 'presention/pages/config_pass/cubit/config_pass_cubit.dart';
import 'presention/pages/detail_riwayat/cubit/detal_history_cubit.dart';
import 'presention/pages/penjemputan/cubit/new_inquiry_cubit.dart';
import 'presention/pages/profile/cubit/profile_change_cubit.dart';
import 'presention/pages/tukar_poin/cubit/tukarpoint_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => TokenCubit(TokenRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(LoginRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => HomeCubit(HomeProfileRespositoryImpl()),
        ),
        BlocProvider(
          create: (context) => ForgotPassCubit(ForgotPasswordRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => ConfigPassCubit(ConfigCodeRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DetalHistoryCubit(DetailHistoryRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => TukarpointCubit(TukarPointRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => BankSampahCubit(LayananRespositoryImpl()),
        ),
        BlocProvider(
          create: (context) => RegistrasiCubit(RegistrasiRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => AutentikasiCubit(AutentikasiRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => LayananCubit(LayananRespositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              ProfileChangeCubit(ChangeProfileRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => NewInquiryCubit(NewInquiryRepositoryImpl()),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authStatus) {
          if (authStatus == AuthState.isLoading) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
          } else if (authStatus == AuthState.authenticated) {
            return const MateriapAppRouter(path: 'NavigasiBar');
          } else if (authStatus == AuthState.unauthenticated) {
            return const MateriapAppRouter(path: 'login');
          } else if (authStatus == AuthState.tokenExpired) {
            context.read<TokenCubit>().fecthRefreshToken();
            BlocBuilder<TokenCubit, TokenState>(
              builder: (context, refreshTokenstate) {
                if (refreshTokenstate is TokenIsLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                } else if (refreshTokenstate is TokenIsSucces) {
                  context.read<AuthCubit>().checkToken();
                  return const MateriapAppRouter(path: 'NavigasiBar');
                }
                return Container();
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

class MateriapAppRouter extends StatelessWidget {
  final String path;
  const MateriapAppRouter({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter(path),
      debugShowCheckedModeBanner: false,
    );
  }
}
