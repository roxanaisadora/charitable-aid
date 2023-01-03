import 'dart:convert';

class DonationPost6 {
  DonationPost6({
    required this.id,
    required this.createdAt,
    required this.image,
  });

  final int id;
  final DateTime createdAt;
  final String image;

  factory DonationPost6.fromJson(String str) =>
      DonationPost6.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost6.fromMap(Map<String, dynamic> json) => DonationPost6(
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
