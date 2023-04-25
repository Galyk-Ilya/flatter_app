import 'package:bloc/bloc.dart';
import '../repo/repo.dart';
import '../states/person_state.dart';

class PersonsCubit extends Cubit<PersonResponseState> {
  Repo personRepo = Repo();

  PersonsCubit() : super(Loading());

  Future<void> getPersons() async {
    emit(Loading());
    try {
      var resp = await personRepo.getPersons();
      emit(Success(resp.data?.results ?? []));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(Error(e.toString()));
    }
  }
}