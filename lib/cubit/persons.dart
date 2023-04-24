import 'package:bloc/bloc.dart';

import '../model/person.dart';
import '../repo/repo.dart';
import '../states/person_state.dart';

class PersonsCubit extends Cubit<PersonResponseState> {
  Repo personRepo = Repo();

  List<Person> persons = [];

  PersonsCubit()
      : super(const PersonResponseState(
            status: Status.loading, error: '', persons: []));

  void getPersons() async {
    emit(const PersonResponseState(status: Status.loading, error: '', persons: []));
    try {
      var resp = await personRepo.getPersons();
      persons = resp.persons;
      emit(PersonResponseState(
          status: Status.success, error: '', persons: persons));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(PersonResponseState(
          status: Status.error, error: e.toString(), persons: []));
    }
  }
}
