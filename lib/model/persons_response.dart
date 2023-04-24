import 'package:flatter_app/model/person.dart';

class PersonResponse {
  List<Person> persons = [];

  PersonResponse({required this.persons});

  factory PersonResponse.fromJson(Map<String, dynamic> json) {
    return PersonResponse(
        persons: (json['data']['results'] as List<dynamic>)
            .map((dynamic e) => Person.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
