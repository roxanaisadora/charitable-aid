import 'dart:convert';

class DonationPost4 {
  DonationPost4({
    required this.id,
    required this.createdAt,
    required this.image,
    required this.title,
  });

  final int id;
  final DateTime createdAt;
  final String image;
  final String title;

  factory DonationPost4.fromJson(String str) =>
      DonationPost4.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost4.fromMap(Map<String, dynamic> json) => DonationPost4(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
        "title": title,
      };
}
