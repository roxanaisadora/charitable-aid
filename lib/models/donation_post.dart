import 'dart:convert';

class DonationPost {
  DonationPost({
    required this.id,
    required this.createdAt,
    required this.image,
    required this.title,
    required this.colaboradores,
    required this.meta,
    required this.personas,
    required this.donadores,
    required this.description,
    required this.donation,
    required this.category,
    required this.subTitle,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.url,
  });

  final int id;
  final DateTime createdAt;
  final String image;
  final String title;
  final int colaboradores;
  final int meta;
  final int personas;
  final int donadores;
  final String description;
  final double donation;
  final String category;
  final String subTitle;
  final String img1;
  final String img2;
  final String img3;
  final String url;

  factory DonationPost.fromJson(String str) =>
      DonationPost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonationPost.fromMap(Map<String, dynamic> json) => DonationPost(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
        title: json["title"],
        colaboradores: json["colaboradores"],
        meta: json["meta"],
        personas: json["personas"],
        donadores: json["donadores"],
        description: json["description"],
        donation: json["donation"].toDouble(),
        category: json["category"],
        subTitle: json["sub_title"],
        img1: json["img_1"],
        img2: json["img_2"],
        img3: json["img_3"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
        "title": title,
        "colaboradores": colaboradores,
        "meta": meta,
        "personas": personas,
        "donadores": donadores,
        "description": description,
        "donation": donation,
        "category": category,
        "sub_title": subTitle,
        "img_1": img1,
        "img_2": img2,
        "img_3": img3,
        "url": url,
      };
}
