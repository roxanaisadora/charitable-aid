

class Building {
    Building({
      required  this.id,
      required  this.name,
      required  this.place,
      required  this.image,
      required  this.fecha,
      required  this.hora,
      required  this.asistiran,
      required  this.favoritos,
      required  this.longitud,
      required  this.latitud,
      required  this.description,
      required  this.ong,
      required  this.place2,
      required  this.img1,
      required  this.img2,
      required  this.img3,
    });

    int id;
    String name;
    String place;
    String image;
    String fecha;
    String hora;
    int asistiran;
    int favoritos;
    double longitud;
    double latitud;
    String description;
    String ong;
    String place2;
    String img1;
    String img2;
    String img3;


    factory Building.fromJson(Map<String, dynamic> json) => Building(
        id: json["id"],
        name: json["name"],
        place: json["place"],
        image: json["image"],
        fecha: json["fecha"],
        hora: json["hora"],
        asistiran: json["asistiran"],
        favoritos: json["favoritos"],
        longitud: json["longitud"].toDouble(),
        latitud: json["latitud"].toDouble(),
        description: json["description"],
        ong: json["ong"],
        place2: json["place2"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
    );


}
