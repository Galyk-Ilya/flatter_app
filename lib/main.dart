import 'package:flatter_app/cubit/comics.dart';
import 'package:flatter_app/cubit/persons.dart';
import 'package:flatter_app/pages/comics_widget.dart';
import 'package:flatter_app/states/person_state.dart';
import 'package:flutter/material.dart';
import 'package:flatter_app/pages/persons_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() =>
    runApp(
        MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.blueAccent,
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<PersonsCubit>(
                  create: (personCubitContext) => PersonsCubit()),
              BlocProvider<ComicsCubit>(
                  create: (comicsCubitContext) => ComicsCubit())
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "NoteApp",
            ),
          ),
          routes: {
            '/': (context) => const PersonWidget()
//    '/comics': (context) => ComicsWidget(id: ''),
          },
        ));
// home: const Comics(),

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return MaterialApp(theme: ThemeData(
//       primaryColor: Colors.blueAccent,
//     ),
//       routes: {
//         '/': (context) => const PersonWidget()
// //    '/comics': (context) => ComicsWidget(id: ''),
//       },
//     );
//   }
//     MaterialApp(theme: ThemeData(
//       primaryColor: Colors.blueAccent,
//     ),
//       routes: {
//         '/': (context) => const PersonWidget()
// //    '/comics': (context) => ComicsWidget(id: ''),
//       },
//     );




// class MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<PersonsCubit>(
//             create: (personCubitContext) => PersonsCubit()),
//         BlocProvider<ComicsCubit>(
//             create: (comicsCubitContext) => ComicsCubit())
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "NoteApp",
//       ),
//     );
//   }
// }





//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Colors.green),
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('testZagolovok'),
//             centerTitle: true,
//           ),
//           body: Center(
//               child: Text(
//             'itProgger App',
//             style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.blue,
//                 fontFamily: 'Times New Roman'),
//           )
//           ),
//          floatingActionButton: FloatingActionButton(
//            onPressed: () { print('click'); },
//            child: Text('нажми'),
//            backgroundColor: Colors.green,
//          ),
//       ),
//     );
//   }
// }
