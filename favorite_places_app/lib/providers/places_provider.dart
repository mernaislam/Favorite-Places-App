import 'dart:io';

import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newItem = Place(
      title: title,
      image: image,
    );
    state = [newItem, ...state];
  }
}

final favPlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) {
  return FavoritePlacesNotifier();
});
