import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoritePlacesNotifier extends StateNotifier<List<Place>>{
  FavoritePlacesNotifier() : super([]);

  void addPlace(Place place){
    state = [...state, place];
  }
}

final favPlacesProvider = StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) {
  return FavoritePlacesNotifier();
});