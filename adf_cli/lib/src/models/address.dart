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

  factory Address.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        "street": final street,
        "number": final number,
        "zipCode": final zipCode,
        "city": final city,
        "phone": final phone,
      } =>
        Address(
          street: street.trim() ?? 0,
          number: number.trim() ?? 0,
          zipCode: zipCode.trim() ?? 0,
          city: city.fromMap(city ?? <String, dynamic>{}),
          phone: phone.fromMap(phone ?? <String, dynamic>{}),
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "number": number,
      "zipCode": zipCode,
      "city": city.toJson(),
      "phone": phone.toJson(),
    };
  }
}
