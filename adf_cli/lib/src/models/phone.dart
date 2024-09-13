
class Phone {
 final int ddd;
final String phone;

  Phone({
    required this.ddd,
    required this.phone
  });

    factory Phone.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        "ddd": final ddd,
        "phone": final phone,
      } =>
        Phone(
          ddd: ddd.trim() ?? 0,
          phone: phone.trim() ?? "",
        ),
      _ => throw ArgumentError('Invalddd Json'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "ddd": ddd,
      "phone": phone,
    };
  }
}