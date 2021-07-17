import 'dart:convert';

class Services {
  List<Services> servicesFromJson(String str) {
    return List<Services>.from(
        json.decode(str).map((e) => Services.fromJson(e)));
  }

  Services({
    required this.id,
    required this.name,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String desc;
  DateTime createdAt;
  DateTime updatedAt;

  factory Services.fromJson(dynamic json) => Services(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
