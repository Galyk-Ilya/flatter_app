import 'package:flatter_app/model/comics_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/persons_list.dart';

class Repo {

  Future<Person> getPersons() async {
    var responsePersons = await http.get(
        Uri.parse('http://gateway.marvel.com/v1/public/characters?apikey=640be62b90bd0041363befc90c85476a&hash=39b00aacf48d1082406160c73df9768e&ts=1'));
    return Person.fromJson(jsonDecode(responsePersons.body));
  }

  Future<ComicsList> getComics(String id) async {
    var responsePersons = await http.get(
        'http://gateway.marvel.com/v1/public/characters/$id/comics?apikey=640be62b90bd0041363befc90c85476a&hash=39b00aacf48d1082406160c73df9768e&ts=1' as Uri);
    return ComicsList.fromJson(jsonDecode(responsePersons.body));
  }
}