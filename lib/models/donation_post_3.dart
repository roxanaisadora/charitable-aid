import 'dart:convert';

class DonationPost3 {
  DonationPost3({
    required this.id,
    required this.createdAt,
    required this.image,
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.num5,
    required this.num6,
  });

  final int id;
  final DateTime createdAt;
  final String image;
  final int num1;
  final int num2;
  final int num3;
  final int num4;
  final int num5;
  final int num6;

  factory DonationPost3.fromJson(String str) =>
      DonationPost3.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost3.fromMap(Map<String, dynamic> json) => DonationPost3(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
        num1: json["num1"],
        num2: json["num2"],
        num3: json["num3"],
        num4: json["num4"],
        num5: json["num5"],
        num6: json["num6"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
        "num1": num1,
        "num2": num2,
        "num3": num3,
        "num4": num4,
        "num5": num5,
        "num6": num6,
      };
}
