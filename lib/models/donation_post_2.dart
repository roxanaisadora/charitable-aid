import 'dart:convert';

class DonationPost2 {
  DonationPost2({
    required this.id,
    required this.createdAt,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.subTitle,
  });

  final int id;
  final DateTime createdAt;
  final String image;
  final String subtitle;
  final String title;
  final String subTitle;

  factory DonationPost2.fromJson(String str) =>
      DonationPost2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost2.fromMap(Map<String, dynamic> json) => DonationPost2(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
        subtitle: json["subtitle"],
        title: json["title"],
        subTitle: json["sub_title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
        "subtitle": subtitle,
        "title": title,
        "sub_title": subTitle,
      };
}
