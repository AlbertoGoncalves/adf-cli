import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Address {
  final String street;
  final int? number;
  final String zipCode;
  final City city;
  final Phone phone;

  Address(
      {required this.street,
      required this.zipCode,
      required this.city,
      required this.phone,
      this.number});

//Serialização de Objeto para Json
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      "street": street,
      "number": number,
      "zipCode": zipCode,
      "city": city.toMap(),
      "phone": phone.toMap(),
    };
    return map;
  }

  String toJson() => jsonEncode(toMap());

//desserialização de Json para Objeto
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
          street: map['street'] ?? '',
          number: map['number'] ?? 0,
          zipCode: map['zipCode'] ?? '',
          city: City.fromMap(map['city'] ?? <String, dynamic>{}),
          phone: Phone.fromMap(map['phone'] ?? <String, dynamic>{}),
    );
  }

  factory Address.fromJson(String json) => Address.fromMap(jsonDecode(json));


}
