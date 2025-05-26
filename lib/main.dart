import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit();
        cubit.authStatus();
        return cubit;
      },
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        title: 'Stroe App', 
        routerConfig:  AppRouter.router,
      ),
    );
  }
}
