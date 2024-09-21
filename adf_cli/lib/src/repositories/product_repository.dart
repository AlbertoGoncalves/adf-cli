
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/course.dart';

class ProductRepository {
  Future<Course> findByName(String name) async {
    // final response = await http.get(Uri.parse('http://177.71.92.209:9001/products?name=$name'));
    final response = await http.get(Uri.parse('http://192.168.3.10:9001/products?name=$name'));

    if(response.statusCode != 200){
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty || responseData == '{}') {
      throw Exception('Produto não cadastrado');
    }

    return Course.fromMap(responseData.first);
  }
}