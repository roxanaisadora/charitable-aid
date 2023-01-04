import 'dart:convert';

class DonationPost1 {
    DonationPost1({
      required  this.id,
      required  this.image,
      required  this.title,
      required  this.sub_title,
      required  this.subtitle,
      required  this.item6,
    });

    int id;
    String image;
    String title;
    String sub_title;
    String subtitle;
    List<Item6> item6;

    factory DonationPost1.fromJson(String str) => DonationPost1.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DonationPost1.fromMap(Map<String, dynamic> json) => DonationPost1(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        sub_title: json["sub_title"],
        subtitle: json["subtitle"],
        item6: List<Item6>.from(json["item_6"].map((x) => Item6.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "sub_title": sub_title,
        "subtitle": subtitle,
        "item_6": List<dynamic>.from(item6.map((x) => x.toMap())),
    };
}

class Item6 {
    Item6({
      required  this.image,
    });

    String image;

    factory Item6.fromJson(String str) => Item6.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item6.fromMap(Map<String, dynamic> json) => Item6(
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "image": image,
    };
}
