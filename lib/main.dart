import 'package:flatter_app/cubit/persons.dart';

import 'package:flutter/material.dart';
import 'package:flatter_app/pages/persons_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: MultiBlocProvider(providers: [
      BlocProvider<PersonsCubit>(
          create: (personCubitContext) => PersonsCubit()),
    ], child: const PersonPage()),
  ));
}