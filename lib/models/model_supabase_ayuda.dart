import 'dart:convert';

class Help {
  String fecha;
  String nombre;
  int? id;
  String hora;

  Help({
    required this.fecha,
    required this.nombre,
    required this.hora,
    this.id,
  });

  factory Help.fromJson(String str) => Help.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  String toJson2() => json.encode(toMap2());

  factory Help.fromMap(Map<String, dynamic> json) => Help(
        fecha: json["fecha"],
        nombre: json["nombre"],
        hora: json["hora"],
      );

  Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "nombre": nombre,
        "hora": hora,
      };
  Map<String, dynamic> toMap2() => {
        "fecha": fecha,
        "nombre": nombre,
        "id":id,
        "hora": hora,
      };

  Help copyWith() => Help(
        fecha: fecha,
        nombre: nombre,
        id: id,
        hora: hora,
      );

  factory Help.fromMap2(Map<String, dynamic> json) => Help(
        id: json['id'], 
        fecha: json["fecha"],
        nombre: json["nombre"], 
        hora: json["hora"],
      );


      
}