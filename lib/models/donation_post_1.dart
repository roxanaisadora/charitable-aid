import 'dart:convert';

class DonationPost1 {
  DonationPost1({
    required this.id,
    required this.createdAt,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.subtitle,
    required this.item6,
  });

  final int id;
  final DateTime createdAt;
  final String image;
  final String title;
  final String subTitle;
  final String subtitle;
  final List<Item6> item6;

  factory DonationPost1.fromJson(String str) =>
      DonationPost1.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost1.fromMap(Map<String, dynamic> json) => DonationPost1(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
        title: json["title"],
        subTitle: json["sub_title"],
        subtitle: json["subtitle"],
        item6: List<Item6>.from(json["item_6"].map((x) => Item6.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
        "title": title,
        "sub_title": subTitle,
        "subtitle": subtitle,
        "item_6": List<dynamic>.from(item6.map((x) => x.toMap())),
      };
}

class Item6 {
  Item6({
    required this.image,
  });

  final String image;

  factory Item6.fromJson(String str) => Item6.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item6.fromMap(Map<String, dynamic> json) => Item6(
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
      };
}
