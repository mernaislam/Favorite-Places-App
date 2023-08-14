import 'dart:io';

import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();
class Place {
  Place({required this.title, required this.image}) : id = uuid;

  final String id;
  final String title;
  final File image;
}