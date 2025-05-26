import 'package:store/features/explore/data/models/explore_model.dart';

sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

final class ExploreLoading extends ExploreState {}

final class ExploreSuccess extends ExploreState {
  final List<ExploreModel> explore;

  ExploreSuccess(this.explore);
}

final class ExploreFailed extends ExploreState {
  final String error;

  ExploreFailed(this.error); 
}
