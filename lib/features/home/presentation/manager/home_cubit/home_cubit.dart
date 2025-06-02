import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  // final shopServices = HomeServicesImpl();
  // final box = Hive.box('shopBox'); 
   int currentIndex = 0;


  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  

  // Future<void> getCategories() async {
  //   final cachedData = box.get('categories');
  //   if (cachedData != null) {
  //     final cachedCategories =
  //         (cachedData as List).map((item) {
  //           final map = Map<String, dynamic>.from(item);
  //           return CateroryModel.fromMap(map);
  //         }).toList();

  //     emit(CatrgoriesSuccess(cachedCategories)); // عرض مباشر من الكاش
  //   } else {
  //     emit(CatrgoriesLoading()); // لو مفيش كاش، اعرض تحميل
  //   }

  //   try {
  //     final categories = await shopServices.getCategories();
  //     await box.put('categories', categories.map((e) => e.toMap()).toList());
  //     emit(CatrgoriesSuccess(categories));
  //   } catch (e) {
  //     if (cachedData == null) {
  //       emit(CatrgoriesFailed(e.toString())); // فقط اذا مفيش كاش يظهر الخطأ
  //     }
  //   }
  // }

}
