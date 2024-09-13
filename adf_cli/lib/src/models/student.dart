
import 'address.dart';
import 'course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;
  
    Student({
    required this.name,
    required this.nameCourses,
    required this.courses,
    required this.address,
    this.id,
    this.age
  });

    //desserialização de Json para Objeto
    factory Student.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": final id,
        "name": final name,
        "age": final age,
        "nameCourses": final nameCourses,
        "courses": final List<Course> courses,
        "address": final address,

      } =>
        Student(
          id: id.trim() ?? 0,
          name: name.trim() ?? "",
          age: age.trim() ?? 0,
          nameCourses: List<String>.from(nameCourses ?? <String>[]),
          courses: courses.map<Course>((e) => Course.fromMap(e as Map<String, dynamic>)).toList() ?? <Course>[],
          address: Address.fromMap(address ?? <String, dynamic>{}),
          
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }

//Serialização de Objeto para Json 
  Map<String, dynamic> toJson() {
    return {
        "id": id,
        "name": name,
        "age": age,
        "nameCourses": nameCourses,
        "courses": courses.map((e) => e.toJson()).toList(),
        "address": address.toJson(),

    };
  }
}