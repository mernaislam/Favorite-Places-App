import 'package:favorite_places_app/screens/add_place_screen.dart';
import 'package:flutter/material.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() {
    return _FavoriteListScreenState();
  }
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const AddPlace(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
