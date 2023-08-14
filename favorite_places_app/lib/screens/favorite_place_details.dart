import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class FavoritePlaceDetails extends StatelessWidget {
  const FavoritePlaceDetails(this.favPlace, {super.key});
  final Place favPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favPlace.title),
      ),
      body: Stack(
        children: [
          Image.file(
            favPlace.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
