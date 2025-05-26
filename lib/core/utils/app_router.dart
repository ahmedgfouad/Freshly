import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/features/account/presentation/address/addresses_veiwe.dart';
import 'package:store/features/account/presentation/address/edit_addresses_view.dart';
import 'package:store/features/account/presentation/address/new_addresses_view.dart';
import 'package:store/features/account/presentation/profile/change_password_view.dart';
import 'package:store/features/account/presentation/profile/edit_profile_view.dart';
import 'package:store/features/account/presentation/order/order_view.dart';
import 'package:store/features/account/presentation/profile/profile_view.dart';
import 'package:store/features/cart/presentation/cart_view.dart';
import 'package:store/features/categories/presentation/views/categories_view.dart';
import 'package:store/features/explore/presentation/view/explore_view.dart';
import 'package:store/features/favorite/presentation/favorite_view.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/home/presentation/view/home_view.dart';
import 'package:store/features/product_details/presentation/view/product_details_view.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';
import 'package:store/features/shop/presentation/views/shop_view.dart';
import 'package:store/features/registeration/presentation/view/log_in_view.dart';
import 'package:store/features/registeration/presentation/view/sign_up_view.dart';
import 'package:store/features/registeration/presentation/view/welcom_view.dart';
import 'package:store/features/splash/presentation/views/splash_viwe.dart';
// import 'package:store/features/splash/presentation/views/splash_viwe.dart';

abstract class AppRouter {
  static String kLogInView = '/logInView';
  static String kSignUpView = '/signUpView';
  static String kWelcomView = '/welcomView';
  static String kHomeView = '/homeView';
  static String kShopView = '/shopView';
  static String kExploreView = '/exporeView';
  static String kCartView = '/cartView';
  static String kFavoriteView = '/favoriteView';
  static String kAccountView = '/accountView';
  static String kCategoriesView = '/categoriesView';
  static String kProfileView = '/profileView';
  static String kEditProfileView = '/editProfileView';
  static String kChangePasswordView = '/changePasswordView';
  static String kProductDetailsView = '/productDetailsView';
  static String kOrderssView = '/ordersView';
  static String kAddressesView = '/addressesView';
  static String kNewAddressesView = '/newAddressesView';
  static String kEditAddressesView = '/editAddressesView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocBuilder<AuthCubit, AuthState>(
            bloc: BlocProvider.of<AuthCubit>(context),
            buildWhen:
                (previous, current) =>
                    current is AuthInitial ||
                    current is LoginSuccessState ||
                    current is SignupSuccessState,
            builder: (context, state) {
              return state is LoginSuccessState ? HomeView() : SplashViwe();
            },
          );
        },
      ),
      GoRoute(path: kWelcomView, builder: (context, state) => WelcomView()),
      GoRoute(path: kLogInView, builder: (context, state) => LogInView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      GoRoute(path: kShopView, builder: (context, state) => ShopView()),
      GoRoute(path: kExploreView, builder: (context, state) => ExploreView()),
      GoRoute(path: kCartView, builder: (context, state) => CartView()),
      GoRoute(path: kFavoriteView, builder: (context, state) => FavoriteView()),
      GoRoute(path: kAccountView, builder: (context, state) => OrderView()),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) {
          final cateroryName = state.extra as String;
          return CategoriesView(categoryName: cateroryName);
        },
      ),
      GoRoute(path: kProfileView, builder: (context, state) => ProfileView()),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => EditProfileView(),
      ),
      GoRoute(
        path: kChangePasswordView,
        builder: (context, state) => ChangePasswordView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailsView(product: product);
        },
      ),
      GoRoute(path: kOrderssView, builder: (context, state) => OrderView()),
      GoRoute(
        path: kAddressesView,
        builder: (context, state) => AddressesView(),
      ),
      GoRoute(
        path: kNewAddressesView,
        builder: (context, state) => NewAddressesView(),
      ),
      GoRoute(
        path: kEditAddressesView,
        builder: (context, state) => EditAddressesView(),
      ),

      // GoRoute(
      //   path: kBookDetailsView,
      //   builder:
      //       (context, state) => BlocProvider(
      //         create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
      //         child: BookDetailsView(
      //           bookModel: state.extra as BookModel,
      //         ),
      //       ),
      // ),
    ],
  );
}
