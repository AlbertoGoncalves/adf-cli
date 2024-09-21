import 'dart:convert';

class Phone {
  final int ddd;
  final String phone;

  Phone({required this.ddd, required this.phone});

//Serialização de Objeto para Json
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "ddd": ddd,
      "phone": phone,
    };
    return map;
  }

  String toJson() => jsonEncode(toMap());

//desserialização de Json para Objeto
  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] ?? "",
      phone: map['phone'] ?? 0,
    );
  }

  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));
}
