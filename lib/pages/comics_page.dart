import 'package:flatter_app/cubit/comics.dart';
import 'package:flatter_app/states/comics_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ComicsPage extends StatefulWidget {
  String personId;

  ComicsPage({Key? key, required this.personId}) : super(key: key);

  static Widget create(String id) {
    return MultiBlocProvider(providers: [
      BlocProvider<ComicsCubit>(
        create: (BuildContext context) => ComicsCubit(),
      ),
    ], child: ComicsPage(personId: id));
  }

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  ComicsCubit get comicsCubit => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    comicsCubit.getComics(widget.personId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('List of comics featuring characters'),
          centerTitle: true,
        ),
        body: BlocBuilder<ComicsCubit, ComicsResponseState>(
            builder: (context, state) {
          if (state is Success) {
            return ListView.builder(
                itemCount: state.comics.length,
                itemBuilder: (BuildContext context, int index) {
                 return Card(
                    child: ListTile(
                      title: Text(state.comics[index].title ?? " "),
                       subtitle:
                           Text(state.comics[index].description ?? " "),
                    ),
                  );
                });
          } else {
            return Container();
          }
        }));
  }
}