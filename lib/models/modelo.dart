class Producto{
  int? id;
  String? nombre;
  String? categoria;
  String? precio;

  Producto(
    this.id,
    this.nombre,
    this.categoria,
    this.precio,
  );

  Producto.fromMap(Map<String, dynamic>map){
    id=map["id"];
    nombre=map["nombre"];
    categoria=map["categoria"];
    precio=map["precio"];
  }

  Map<String,dynamic>toMap(){
    return{

    };
  }
}