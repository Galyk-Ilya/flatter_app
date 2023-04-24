import 'package:equatable/equatable.dart';

import '../model/person.dart';

enum Status { loading, success, error }

class PersonResponseState extends Equatable {
  final List<Person> persons;
  final Status status;
  final String error;

  const PersonResponseState(
      {required this.persons, required this.status, required this.error});

  @override
  List<Object> get props => [persons, status, error];

  @override
  bool get stringify => true;

  PersonResponseState copyWith({
    required Status status,
    required String error,
    required List<Person> persons,
  }) {
    return PersonResponseState(
      status: status ?? this.status,
      error: error ?? this.error,
      persons: persons ?? this.persons,
    );
  }
}
