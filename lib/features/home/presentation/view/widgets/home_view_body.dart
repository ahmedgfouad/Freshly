import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/features/account/presentation/account_view.dart';
import 'package:store/features/cart/presentation/view/cart_view.dart';
import 'package:store/features/explore/presentation/view/explore_view.dart';
import 'package:store/features/favorite/presentation/view/favorite_view.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:store/features/shop/presentation/views/shop_view.dart';
import 'package:store/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Widget> screen = const [
    ShopView(),
    ExploreView(),
    CartView(),
    FavoriteView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: homeCubit.currentIndex, children: screen),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              ),
            ),
            child: BottomNavigationBar(
              onTap: (index) => homeCubit.changeIndex(index),
              showUnselectedLabels: true,
              currentIndex: homeCubit.currentIndex,
              backgroundColor: Colors.white,
              unselectedItemColor: context.appColors.browen,
              selectedItemColor: context.appColors.orange,
              unselectedLabelStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_filled, size: 30),
                  label: S.of(context).Shop,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.search, size: 30),
                  label: S.of(context).Explore,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart, size: 30),
                  label: S.of(context).Cart,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite, size: 30),
                  label: S.of(context).Favorite,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person, size: 30),
                  label: S.of(context).Account,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
