import 'package:flatter_app/cubit/comics.dart';
import 'package:flatter_app/states/comics_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ComicsWidget extends StatefulWidget {
  final String personId;

  const ComicsWidget({Key? key, required this.personId}) : super(key: key);

  @override
  State<ComicsWidget> createState() => _ComicsWidgetState();
}

class _ComicsWidgetState extends State<ComicsWidget> {
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
                  Card(
                    child: ListTile(
                      title: Text(state.comics[index].title.toString()),
                      subtitle:
                          Text(state.comics[index].description.toString()),
                    ),
                  );
                  // Column(
                  //   children: [
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.pushReplacementNamed(context, '/');
                  //         },
                  //         child: const Text('back'))
                  //   ],
                  // );
                });
          } else {
            return Container();
          }
        }));
  }
}
