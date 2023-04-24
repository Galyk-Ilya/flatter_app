import 'package:equatable/equatable.dart';

import '../model/comics.dart';
enum Status { loading, success, error }

class ComicsResponseState extends Equatable {
  final List<Comics> comics;
  final Status status;
  final String error;

  const ComicsResponseState(
      {required this.comics, required this.status, required this.error});

  @override
  List<Object> get props => [comics, status, error];

  @override
  bool get stringify => true;

  ComicsResponseState copyWith({
    required Status status,
    required String error,
    required List<Comics> comics,
  }) {
    return ComicsResponseState(
      status: status ?? this.status,
      error: error ?? this.error,
      comics: comics ?? this.comics,
    );
  }
}
