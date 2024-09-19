import 'dart:convert';

import 'address.dart';
import 'course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;

  Student(
      {required this.name,
      required this.nameCourses,
      required this.courses,
      required this.address,
      this.id,
      this.age});

//Serialização de Objeto para Json
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "id": id,
      "name": name,
      "age": age,
      "nameCourses": nameCourses,
      "courses": courses.map((e) => e.toMap()).toList(),
      "address": address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

  String toJson() => jsonEncode(toMap());

  //desserialização de Json para Objeto
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      age: map['age'] ?? 0,
      nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
      courses: map['courses'].map<Course>((e) => Course.fromMap(e)).toList() ??
          <Course>[],
    );
  }

  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));
}
