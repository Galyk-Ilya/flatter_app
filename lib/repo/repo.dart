import 'package:flatter_app/model/comics_response.dart';
import 'package:flatter_app/model/persons_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Repo {

  Future<PersonResponse> getPersons() async {
    var responsePersons = await http.get(
        'http://gateway.marvel.com/v1/public/characters?apikey=640be62b90bd0041363befc90c85476a&hash=39b00aacf48d1082406160c73df9768e&ts=1');
    return PersonResponse.fromJson(jsonDecode(responsePersons.body));
  }

  Future<ComicsResponse> getComics() async {
    var responsePersons = await http.get(
        'http://gateway.marvel.com/v1/public/characters/1011334/comics?apikey=640be62b90bd0041363befc90c85476a&hash=39b00aacf48d1082406160c73df9768e&ts=1');
    return ComicsResponse.fromJson(jsonDecode(responsePersons.body));
    //каким-то образом нужно прокинуть сюда id ?????
  }
}
