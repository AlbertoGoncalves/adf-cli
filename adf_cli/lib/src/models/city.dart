import 'dart:convert';

class City {
  City({required this.id, required this.name});
  final int id;
  final String name;

//Serialização de Objeto para Json
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "id": id,
      "name": name,
    };
    return map;
  }

  String toJson() => jsonEncode(toMap());

//desserialização de Json para Objeto
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
    );
  }

  factory City.fromJson(String json) => City.fromMap(jsonDecode(json));
}
