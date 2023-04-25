import 'package:flatter_app/cubit/comics.dart';
import 'package:flatter_app/cubit/persons.dart';

import 'package:flutter/material.dart';
import 'package:flatter_app/pages/persons_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<PersonsCubit>(
            create: (personCubitContext) => PersonsCubit()),
        BlocProvider<ComicsCubit>(
            create: (comicsCubitContext) => ComicsCubit())
      ], child: const PersonWidget()),
    ));
