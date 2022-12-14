import 'dart:convert';

class DonationPost7 {
    DonationPost7({
      required  this.id,
      required  this.image,
      required  this.title,
      required  this.colaboradores,
      required  this.meta,
      required  this.personas,
      required  this.donadores,
      required  this.donation,
      required  this.description,
      required  this.subTitle,
      required  this.img1,
      required  this.img2,
      required  this.img3,
      required  this.url,
      required this.qr1,
      required this.qr2,
      required this.qr3,
      required this.socio,
      required this.numero,
    });

    int id;
    String image;
    String title;
    double colaboradores;
    double meta;
    int personas;
    int donadores;
    double donation;
    String description;
    String subTitle;
    String img1;
    String img2;
    String img3;
    String url;
    String qr1;
    String qr2;
    String qr3;
    String socio;
    int numero;

    factory DonationPost7.fromJson(String str) => DonationPost7.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DonationPost7.fromMap(Map<String, dynamic> json) => DonationPost7(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        colaboradores: json["colaboradores"].toDouble(),
        meta: json["meta"].toDouble(),
        personas: json["personas"],
        donadores: json["donadores"],
        donation: json["donation"].toDouble(),
        description: json["description"],
        subTitle: json["sub_title"],
        img1: json["img_1"],
        img2: json["img_2"],
        img3: json["img_3"],
        url: json["url"],
        qr1: json["qr1"],
        qr2: json["qr2"],
        qr3: json["qr3"],
        socio: json["socio"],
        numero: json["numero"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "colaboradores": colaboradores,
        "meta": meta,
        "personas": personas,
        "donadores": donadores,
        "donation": donation,
        "description": description,
        "sub_title": subTitle,
        "img_1": img1,
        "img_2": img2,
        "img_3": img3,
        "url": url,
        "qr1": qr1,
        "qr2": qr2,
        "qr3": qr3,
        "socio": socio,
        "numero": numero,
    };
}