import 'dart:convert';
import 'package:crayondcart/Models/showCase2Model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class Apiservice {
  String url2 = "https://jsonplaceholder.typicode.com/posts";

  Future<List<UserModel>> fetchUsers() async {
    final response = await get(Uri.parse(url2));

    if (response.statusCode == 200) {
      final List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiDataProvider = Provider<Apiservice>(
  (ref) {
    return Apiservice();
  },
);
