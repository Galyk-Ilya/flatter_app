import 'package:flatter_app/model/comics_list.dart';

class ComicsResponseState {}

class Success extends ComicsResponseState {
  List<Results> comics;

  Success(this.comics);
}

class Loading extends ComicsResponseState {}

class Error extends ComicsResponseState {
  String error;

  Error(this.error);
}