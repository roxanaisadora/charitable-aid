import 'dart:convert';

class DonationPost5 {
  DonationPost5({
    required this.id,
    required this.createdAt,
    required this.image,
  });

  final int id;
  final DateTime createdAt;
  final String image;

  factory DonationPost5.fromJson(String str) =>
      DonationPost5.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost5.fromMap(Map<String, dynamic> json) => DonationPost5(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
      };
}
