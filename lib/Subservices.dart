import 'dart:convert';

class Subservices {
  List<Subservices> servicesFromJson(String str) {
    return List<Subservices>.from(
        json.decode(str).map((e) => Subservices.fromJson(e)));
  }

  Subservices({
    required this.id,
    required this.name,
    required this.desc,
    required this.dalelServiceId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String desc;
  int dalelServiceId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Subservices.fromJson(dynamic jsonSubServices) => Subservices(
        id: jsonSubServices["id"],
        name: jsonSubServices["name"],
        desc: jsonSubServices["desc"],
        dalelServiceId: jsonSubServices["dalel_service_id"],
        createdAt: DateTime.parse(jsonSubServices["created_at"]),
        updatedAt: DateTime.parse(jsonSubServices["updated_at"]),
      );
}
