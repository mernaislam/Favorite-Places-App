import 'package:favorite_places_app/providers/places_provider.dart';
import 'package:favorite_places_app/screens/add_place_screen.dart';
import 'package:favorite_places_app/screens/favorite_place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerStatefulWidget {
  const PlacesListScreen({super.key});

  @override
  ConsumerState<PlacesListScreen> createState() {
    return _FavoriteListScreenState();
  }
}

class _FavoriteListScreenState extends ConsumerState<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    final favPlacesList = ref.watch(favPlacesProvider);
    Widget mainContent;
    if (favPlacesList.isEmpty) {
      mainContent = Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white
          ),
          
        ),
      );
    } else {
      mainContent = ListView.builder(
        itemCount: favPlacesList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FavoritePlaceDetails(
                  favPlacesList[index],
                ),
              ),
            );
          },
          child: ListTile(
            leading: Text(
              favPlacesList[index].title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddPlaceScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: mainContent,
    );
  }
}
