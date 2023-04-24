import 'dart:convert';

import 'package:flatter_app/pages/comics_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../cubit/persons.dart';
import '../states/person_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonWidget extends StatefulWidget {
  const PersonWidget({Key? key}) : super(key: key);

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  // PersonsCubit personsCubit = PersonsCubit();

  @override
  void initState() {
    super.initState();
    // personsCubit.getPersons();
    // persons.addAll(personsCubit.persons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Список героев'),
          centerTitle: true,
        ),
        body: BlocBuilder<PersonsCubit, PersonResponseState>(
            builder: (context, state) {
          return ListView.builder(
              itemCount: state.persons.length,
              itemBuilder: (BuildContext context, int index) {
                Card(
                  child: ListTile(
                    title: Text(state.persons[index].name),
                    trailing: IconButton(
                      icon: Image.network(jsonDecode(http.get(
                              '${state.persons[index].thumbnail.path}/standard_small.${state.persons[index].thumbnail.extension}')
                          as String)),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ComicsWidget(
                              id: state.persons[index].id,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              });
        }));
  }
}
