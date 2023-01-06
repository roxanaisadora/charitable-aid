import 'dart:convert';

class Donation {
  String categoria;
  String nombre;
  int? id;
  String precio;
  String image;

  Donation({
    required this.categoria,
    required this.nombre,
    required this.precio,
    required this.image,
    this.id,
  });

  factory Donation.fromJson(String str) => Donation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  String toJson2() => json.encode(toMap2());

  factory Donation.fromMap(Map<String, dynamic> json) => Donation(
        categoria: json["categoria"],
        nombre: json["nombre"],
        precio: json["precio"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "categoria": categoria,
        "nombre": nombre,
        "precio": precio,
        "image": image,
      };
  Map<String, dynamic> toMap2() => {
        "categoria": categoria,
        "nombre": nombre,
        "id":id,
        "precio": precio,
        "image": image,
      };

  Donation copyWith() => Donation(
        categoria: categoria,
        nombre: nombre,
        id: id,
        precio: precio,
        image: image,
      );

  factory Donation.fromMap2(Map<String, dynamic> json) => Donation(
        id: json['id'], 
        categoria: json["categoria"],
        nombre: json["nombre"], 
        precio: json["precio"],
        image: json["image"],
      );


      
}