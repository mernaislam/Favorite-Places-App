import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoritePlacesNotifier extends StateNotifier{
  FavoritePlacesNotifier() : super([]);

  void addPlace(){
    // state = [...state, ]
  }
}

final favPlacesProvider = StateNotifierProvider((ref) {
  return FavoritePlacesNotifier();
});