import 'package:flatter_app/model/comics.dart';
class ComicsResponse {
  List<Comics> comics = [];

  ComicsResponse({required this.comics});

  factory ComicsResponse.fromJson(Map<String, dynamic> json) {
    return ComicsResponse(
        comics: (json['data']['results'] as List<dynamic>)
            .map((dynamic e) => Comics.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}