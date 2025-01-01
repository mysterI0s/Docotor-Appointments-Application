abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteToggled extends FavoriteState {
  final bool isFavorite;

  final int index;

  FavoriteToggled({required this.index, required this.isFavorite});
}
