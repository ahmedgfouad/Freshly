import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/explore/data/services/explore_services.dart';
import 'package:store/features/explore/presentation/manager/explore_cubit/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());

  Future<void> getExplore() async {
    final exploreSrevice = ExploreServicesImpl();
    emit(ExploreLoading());
    try { 
      final explore = await exploreSrevice.getExploreImages(); 
      emit(ExploreSuccess(explore));
    } catch (e) {
      emit(ExploreFailed(e.toString()));
    }
  }
}
