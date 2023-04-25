import 'package:bloc/bloc.dart';

import '../repo/repo.dart';
import '../states/comics_state.dart';

class ComicsCubit extends Cubit<ComicsResponseState> {
  Repo comicsRepo = Repo();

  ComicsCubit() : super(Loading());

  Future<void> getComics(String id) async {
    emit(Loading());
    try {
      var resp = await comicsRepo.getComics(id);
      emit(Success(resp.data?.results ?? []));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(Error(e.toString()));
    }
  }
}