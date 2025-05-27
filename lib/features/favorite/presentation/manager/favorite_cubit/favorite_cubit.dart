import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/favorite/data/services/favorite_services.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:store/features/home/data/models/save_product_model.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()) {
    getFavoriteItems();
  }

  final favoriteServices = FavoriteServicesImpl(); 
  StreamSubscription? streamSubscription;

  void getFavoriteItems() {
    streamSubscription = favoriteServices.getFavoriteItem().listen(
      (favoriteItem) {
        emit(FavoriteSuccessState(favoriteItem));
      },
      onError: (e) {
        emit(FavoriteFailedState(e.toString()));
      },
    );
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }

  Future<void> deleteFromFavorite(SaveProductModel product) async {
    emit(DeleteFromFavoriteLoadingState());
    try {
      favoriteServices.deleteProductFromFavorite(product);
      emit(DeleteFromFavoriteSuccessState());
    } catch (e) {
      emit(DeleteFromFavoriteFailedState(e.toString()));
    }
  }
}
