class City {
  City({required this.id, required this.name});
  final int id;
  final String name;

  factory City.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": final id,
        "name": final name,
      } =>
        City(
          id: id.trim() ?? 0,
          name: name.trim() ?? "",
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
