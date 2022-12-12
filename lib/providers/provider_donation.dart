

import 'package:ac/models/modelo.dart';
import 'package:ac/services/base_dato.dart';
import 'package:flutter/material.dart';


class ProductoProvider extends ChangeNotifier{
  final dbProducto = DBProducto.instance;

  List<Producto> product = [];
  
  //crear producto
  void insertProduct(nombre, categoria, precio) async{
    Map<String, dynamic> row = {
      DBProducto.columnNombre:nombre,
      DBProducto.columnCategoria:categoria,
      DBProducto.columnPrecio:precio,
    };
    Producto producto = Producto.fromMap(row);
    final id = await dbProducto.crearProducto(producto);
    print(id);
  }

  //listar producto
  void queryAll() async{
    final allrows = await dbProducto.queryAllProductos();
    product.clear();

    for (var element in allrows){
      product.add(Producto.fromMap(element));
    }
    notifyListeners();
  }

  //borrar uno
  void delete(id) async {
    final item = await dbProducto.delete(id);
    print(item);
    notifyListeners();
  }

  //Borrar la lista 
  void deleteAll()async{
    final itemAll = await dbProducto.deleteRowAll();
    notifyListeners();
  }

  //Actualizar
  void update(id, nombre, categoria, precio) async{
    Producto producto = Producto(id, nombre,categoria, precio);
  }

}