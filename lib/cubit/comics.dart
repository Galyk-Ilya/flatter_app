import 'package:bloc/bloc.dart';

import '../model/comics.dart';
import '../repo/repo.dart';
import '../states/comics_state.dart';

class ComicsCubit extends Cubit<ComicsResponseState> {
  Repo comicsRepo = Repo();

  List<Comics> comics = [];

  ComicsCubit()
      : super(const ComicsResponseState(
      status: Status.loading, error: '', comics: []));

  void getComics() async {
    emit(const ComicsResponseState(status: Status.loading, error: '', comics: []));
    try {
      var resp = await comicsRepo.getComics(/*id*/);
      comics = resp.comics;
      emit(ComicsResponseState(
          status: Status.success, error: '', comics: comics));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(ComicsResponseState(
          status: Status.error, error: e.toString(), comics: []));
    }
  }
}