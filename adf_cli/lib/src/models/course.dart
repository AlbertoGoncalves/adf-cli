import 'dart:ffi';

class Course {
  final int id;
  final String name;
  final Bool isStudent;

    Course({
    required this.name,
    required this.isStudent,
    required this.id
  });

    factory Course.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": final id,
        "name": final name,
        "isStudent": final isStudent,
      } =>
        Course(
          id: id.trim() ?? 0,
          name: name.trim() ?? 0,
          isStudent: isStudent.trim() ?? false,
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "isStudent": isStudent,
    };
  }
}