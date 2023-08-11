import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class FavoritePlaceDetails extends StatelessWidget{
  const FavoritePlaceDetails(this.favPlace, {super.key});
  final Place favPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favPlace.title),
      ),
    );
  }
}