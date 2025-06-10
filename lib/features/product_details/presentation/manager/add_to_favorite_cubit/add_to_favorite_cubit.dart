import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/product_details/data/services/add_to_favorite_services.dart';
import 'package:store/features/product_details/presentation/manager/add_to_favorite_cubit/add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  AddToFavoriteCubit(this.addtofavoriteServices) : super(AddToFavoriteInitial());

  bool isFavorite = false;

  final AddToFavoriteServices addtofavoriteServices ;

  Future<void> addToFavorite(SaveProductModel product) async {
    emit(AddToFavoriteLoadingState());
    try {
      addtofavoriteServices.addProductToFavorite(product);
      isFavorite = !isFavorite;

      emit(AddToFavoriteSuccessState());
    } catch (e) {
      emit(AddToFavoriteFailedState(e.toString()));
    }
  }

 
}
