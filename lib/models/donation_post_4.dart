import 'dart:convert';

class DonationPost4 {
    DonationPost4({
      required  this.id,
      required  this.image,
      required  this.title,
      required  this.yotube,
      required  this.title2,
      required  this.description,
      required  this.imagenes,
    });

    int id;
    String image;
    String title;
    String yotube;
    String title2;
    String description;
    List<Imagene> imagenes;

    factory DonationPost4.fromJson(String str) => DonationPost4.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DonationPost4.fromMap(Map<String, dynamic> json) => DonationPost4(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        yotube: json["yotube"],
        title2: json["title2"],
        description: json["description"],
        imagenes: List<Imagene>.from(json["imagenes"].map((x) => Imagene.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "yotube": yotube,
        "title2": title2,
        "description": description,
        "imagenes": List<dynamic>.from(imagenes.map((x) => x.toMap())),
    };
}

class Imagene {
    Imagene({
      required  this.image,
    });

    String image;

    factory Imagene.fromJson(String str) => Imagene.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Imagene.fromMap(Map<String, dynamic> json) => Imagene(
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "image": image,
    };
}