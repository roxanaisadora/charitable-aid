
import 'dart:convert';
import 'package:ac/models/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchSeresvice extends ChangeNotifier {
  final String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/search';
  final List<Building> searchpost = [];
  late Building seleccionarLugar2;
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';

  bool isLoading = true;
  bool isSaving = false;

  SearchSeresvice() {
    listarsearchpost1();
  }

  //LISTAR donaciones
  Future<List<Building>> listarsearchpost1() async {
    isLoading = true;
    notifyListeners();
    print('entro');
    final url = Uri.parse('$baseUrl?select=*');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.get(url,headers: header );
    dynamic parsedJson = json.decode(response.body);

   for (var i = 0; i < parsedJson.length; i++){
    searchpost.add(Building.fromMap(parsedJson[i]));
   }

    isLoading = false;
    notifyListeners();
    return searchpost;
  }

  //VALIDAR
  Future crearOactualizar(Building searchpost1) async {
    isSaving = true;
    notifyListeners();

    await actualizarsearchpost1(searchpost1);

    isSaving = false;
    notifyListeners();
  }

  //ACTUALIZAR donaciones
  Future actualizarsearchpost1(Building searchpost1) async {
    print(searchpost1.id);
    final url = Uri.parse('$baseUrl?id=eq.${searchpost1.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.put(url, body: searchpost1.toJson(), headers: header);
    final decodedData = response.body;
    final index = searchpost.indexWhere((element) => element.id == searchpost1.id);
    searchpost[index] = searchpost1;
    return searchpost1.id;
  }


  //BORRAR donaciones
  Future<String> borrarHelp(Building searchpost1) async {
    print(searchpost1.id);
    final url = Uri.parse('$baseUrl?id=eq.${searchpost1.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.delete(url,headers: header );
    searchpost.remove(searchpost1);
    notifyListeners();
    return '${searchpost1.id}';
  }
}