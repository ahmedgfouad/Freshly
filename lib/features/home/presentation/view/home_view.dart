import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/account/presentation/account_view.dart';
import 'package:store/features/cart/presentation/view/cart_view.dart';
import 'package:store/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:store/features/explore/presentation/view/explore_view.dart';
import 'package:store/features/favorite/presentation/favorite_view.dart';
import 'package:store/features/shop/presentation/manager/cubit/shop_cubit.dart';
import 'package:store/features/shop/presentation/views/shop_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      BlocProvider(
        create: (context) {
          final cubit = ShopCubit();
          cubit.getShopProducts();
          
          return cubit;
        },
        child: ShopView(),
      ),
      BlocProvider(
        create: (context) {
          final cubit = ExploreCubit();
          cubit.getExplore();
          return cubit;
        },
        child: ExploreView(),
      ),
      CartView(),
      FavoriteView(),
      AccountView(),
    ];
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screen),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          unselectedItemColor: AppColors().browen,
          selectedItemColor: AppColors().orange,
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Shop',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
