import 'dart:convert';

class Donation {
  String categoria;
  String nombre;
  int? id;
  String precio;

  Donation({
    required this.categoria,
    required this.nombre,
    required this.precio,
    this.id,
  });

  factory Donation.fromJson(String str) => Donation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  String toJson2() => json.encode(toMap2());

  factory Donation.fromMap(Map<String, dynamic> json) => Donation(
        categoria: json["categoria"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "categoria": categoria,
        "nombre": nombre,
        "precio": precio,
      };
  Map<String, dynamic> toMap2() => {
        "categoria": categoria,
        "nombre": nombre,
        "id":id,
        "precio": precio,
      };

  Donation copyWith() => Donation(
        categoria: categoria,
        nombre: nombre,
        id: id,
        precio: precio,
      );

  factory Donation.fromMap2(Map<String, dynamic> json) => Donation(
        id: json['id'], 
        categoria: json["categoria"],
        nombre: json["nombre"], 
        precio: json["precio"],
      );


      
}