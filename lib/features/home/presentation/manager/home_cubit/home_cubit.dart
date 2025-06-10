import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

   int currentIndex = 0;


  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  } 
}
