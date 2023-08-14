import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/screens/favorite_place_details.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    Widget mainContent;
    if (places.isEmpty) {
      mainContent = Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      );
    } else {
      mainContent = ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FavoritePlaceDetails(
                  places[index],
                ),
              ),
            );
          },
        ),
      );
    }
    return mainContent;
  }
}
