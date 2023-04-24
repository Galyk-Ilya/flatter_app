import 'package:flatter_app/model/thumbnail.dart';

class Person {
  String id;
  String name;
  Thumbnail thumbnail;

  Person({required this.id, required this.name, required this.thumbnail});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        id: json['id'] as String,
        name: json['name'] as String,
        thumbnail: json['thumbnail'] as Thumbnail);
  }
}
