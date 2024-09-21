import 'dart:convert';

class Course {
  final int id;
  final String name;
  bool isStudent;

  Course({required this.name, required this.isStudent, required this.id});

//Serialização de Objeto para Json
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "id": id,
      "name": name,
      "isStudent": isStudent,
    };
    return map;
  }

  String toJson() => jsonEncode(toMap());

//desserialização de Json para Objeto
  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      isStudent: map['isStudent'] ?? false,
    );
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
}
