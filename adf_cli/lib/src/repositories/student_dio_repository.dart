import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentDioRepository {
  Future<List<Student>> findAll() async {
    try {
      final response = await Dio().get('http://192.168.3.10:9001/students');

      if (response.data.isEmpty) {
        throw Exception('Students não cadastrados');
      }

      return response.data.map<Student>((e) {
        return Student.fromMap(e);
      }).toList();
    } on DioException {
      throw Exception();
    }
  }

  Future<Student> findById(int id) async {
    try {
      final response = await Dio().get('http://192.168.3.10:9001/students/$id');

      if (response.data == null) {
        throw Exception('Estudante não cadastrado');
      }

      return Student.fromMap(response.data);
    } on DioException {
      throw Exception();
    }
  }

  Future<void> insert(Student student) async {
    try {
      await Dio().post(
        'http://192.168.3.10:9001/students',
        data: student.toMap(),
      );
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> update(Student student) async {
    try {
      await Dio().put(
        'http://192.168.3.10:9001/students/${student.id}',
        data: student.toMap(),
      );
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> deleteById(Student student) async {
    try {
      await Dio().delete(
        'http://192.168.3.10:9001/students/${student.id}',
        data: student.toMap(),
      );
    } on DioException catch (e) {
      print(e);
      throw Exception();
    }
  }
}
