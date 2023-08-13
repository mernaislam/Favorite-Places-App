import 'package:favorite_places_app/providers/places_provider.dart';
import 'package:favorite_places_app/screens/add_place_screen.dart';
import 'package:favorite_places_app/widgets/place_list.dart';
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
      body: PlacesList(places: favPlacesList),
    );
  }
}
