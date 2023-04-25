import 'package:flatter_app/pages/comics_widget.dart';
import 'package:flutter/material.dart';

import '../cubit/persons.dart';
import '../states/person_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonWidget extends StatefulWidget {
  const PersonWidget({Key? key}) : super(key: key);

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  PersonsCubit get personsCubit => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    personsCubit.getPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('List of characters'),
          centerTitle: true,
        ),
        body: BlocBuilder<PersonsCubit, PersonResponseState>(
            builder: (context, state) {
          if (state is Success) {
            return ListView.builder(
                itemCount: state.persons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.persons[index].name ?? ''),
                      trailing: IconButton(
                        icon: Image.network(
                            '${state.persons[index].thumbnail?.path}/standard_small.${state.persons[index].thumbnail?.extension}'),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComicsWidget(
                                personId: state.persons[index].id.toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        }));
  }
}
