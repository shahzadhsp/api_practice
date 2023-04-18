import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modal_class.dart';

class UserApiService {
  Future<List<ModelClass>> fetchdata() async {
    String baseUrl = 'https://jsonplaceholder.typicode.com';

    String endUrl = '/users';
    String Url = baseUrl + endUrl;
    var response = await http.get(Uri.parse(Url));
    List data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data.map((e) => ModelClass.fromJson(e)).toList();
    }
    return [];
  }
}

























// Future<List<Person>> fetchdata() async {
//     String getUrl = 'https://jsonplaceholder.typicode.com/posts';
//     var response = await get(Uri.parse(getUrl));
//     if (response.statusCode == 200) {
//       List data = jsonDecode(response.body);
//       return data.map((e) => Person.fromJson(e)).toList();
//     }
//     return [];