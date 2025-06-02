import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            final cubit = HomeCubit();  
            return cubit;
          },
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
