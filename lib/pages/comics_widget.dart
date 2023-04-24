import 'package:flatter_app/cubit/comics.dart';
import 'package:flatter_app/states/comics_state.dart';

import 'package:flutter/material.dart';

import '../cubit/comics.dart';
import '../states/comics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicsWidget extends StatefulWidget {
  String id;

 //  const ComicsWidget({Key? key}) : super(key: key);
  ComicsWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<ComicsWidget> createState() => _ComicsWidgetState();
}

class _ComicsWidgetState extends State<ComicsWidget> {
  List comics = [];

  @override
  void initState() {
    super.initState();
    //  comics.addAll(['1 элемент', '2 элемент', '3 элемент']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Список комиксов с участием персонажа'),
        centerTitle: true,
      ),
      body:
        BackButton()










      // BlocBuilder<ComicsCubit, ComicsResponseState>(
      //     builder: (context, state) {
      //       return ListView.builder(
      //           itemCount: state.persons.length,
      //           itemBuilder: (BuildContext comtext, int index) {
      //             Card(
      //               child: ListTile(
      //                 title: Text(state.persons[index].name),
      //                 trailing: IconButton(
      //                   icon: Image.network(jsonDecode(http.get(
      //                       '${state.persons[index].thumbnail
      //                           .path}/standard_small.${state
      //                           .persons[index].thumbnail.extension}') as String
      //                   )), // убедиться что открывает картинку
      //                   iconSize: 50,
      //                   onPressed: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) =>
      //                             ComicsWidget(
      //                               id: state.persons[index].id,
      //                             ),
      //                       ),
      //                     );
      //                     // Navigator.of(context).push(MaterialPageRoute<void>
      //                     //   (builder: (BuildContext context) => const _ComicsWidgetState();
      //                   },
      //                 ),
      //               ),
      //             );
      //             Column(
      //               children: [
      //                 ElevatedButton(onPressed: () {
      //                   Navigator.pushReplacementNamed(context, '/');
      //                 }, child: const Text('Вернуться к списку персонажей'))
      //               ],
      //             );
      //           }
      //       );
      //     }),
         );

// поля для строк  title и description
  }
}
