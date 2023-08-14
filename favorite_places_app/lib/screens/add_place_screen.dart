import 'dart:io';

import 'package:favorite_places_app/providers/places_provider.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen ({super.key});
  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace(){
    final enteredTitle = _titleController.text;
    if(enteredTitle.isEmpty || _selectedImage == null){
      return;
    }

    ref.read(favPlacesProvider.notifier).addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              ImageInput(
                onPickImage: (image){
                  _selectedImage = image;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const LocationInput(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
