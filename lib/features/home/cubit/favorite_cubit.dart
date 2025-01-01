import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final List<bool> favorites;

  FavoriteCubit(int itemCount)
      : favorites = List.generate(itemCount, (index) => false),
        super(FavoriteInitial());

  void toggleFavorite(int index) {
    favorites[index] = !favorites[index];
    emit(FavoriteToggled(index: index, isFavorite: favorites[index]));
  }

  bool isFavorite(int index) => favorites[index];
}
