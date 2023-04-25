import 'package:flatter_app/model/persons_list.dart';

class PersonResponseState {}

class Success extends PersonResponseState {
  List<Results> persons;

  Success(this.persons);
}

class Loading extends PersonResponseState {}

class Error extends PersonResponseState {
  String error;

  Error(this.error);
}