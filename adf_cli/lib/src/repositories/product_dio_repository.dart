
import 'package:dio/dio.dart';

import '../models/course.dart';

class ProductDioRepository {
  Future<Course> findByName(String name) async {
    try {
      final response =
          await Dio().get('http://192.168.3.10:9001/products',
          queryParameters: {
            "name": name,
          });

      if (response.data.isEmpty) {
        throw Exception('Produto não cadastrado');
      }

      return Course.fromMap(response.data.first);
    } on DioException {
      throw Exception();
    }
  }
}
