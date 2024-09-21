import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentRepository {
  Future<List<Student>> findAll() async {
    final studentsResult =
        // await http.get(Uri.parse('http://177.71.92.209:9001/students'));
        await http.get(Uri.parse('http://192.168.3.10:9001/students'));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }
    
    final studentsData = jsonDecode(studentsResult.body);

    // if (studentsData.isEmpty) {
    //   throw Exception('Students não cadastrados');
    // }

    return studentsData.map<Student>((e) {
      return Student.fromMap(e);
    }).toList();
  }

  Future<Student> findById(int id) async {
    final response =
        await http.get(Uri.parse('http://192.168.3.10:9001/students/$id'));

    if (response.statusCode != 200) {
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty || responseData == '{}') {
      throw Exception('Estudante não cadastrado');
    }

    return Student.fromMap(responseData);
  }

  Future<void> insert(Student student) async {
    final studentsResult = await http.post(
        Uri.parse('http://192.168.3.10:9001/students'),
        body: student.toJson(),
        headers: {'contentType': 'aplication/json'});

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(Student student) async {
        final studentsResult = await http.put(
        Uri.parse('http://192.168.3.10:9001/students/${student.id}'),
        body: student.toJson(),
        headers: {'contentType': 'aplication/json'});

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(Student student) async {
            final studentsResult = await http.delete(
        Uri.parse('http://192.168.3.10:9001/students/${student.id}'),
        body: student.toJson(),
        headers: {'contentType': 'aplication/json'});

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }
  }
}
