import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();
class Place {
  Place({required this.title}) : id = uuid;

  final String id;
  final String title;
}