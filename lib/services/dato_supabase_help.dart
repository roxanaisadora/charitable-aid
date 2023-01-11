import 'dart:convert';
import 'package:ac/models/model_supabase_ayuda.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HelpSeresvice extends ChangeNotifier {
  final String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/ayuda';
   List<Help> helpes = [];
  late Help seleccionarLugar2;
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';

  bool isLoading = true;
  bool isSaving = false;

  HelpSeresvice() {
    listarHelp();
  }

  //LISTAR donaciones
  Future<List<Help>> listarHelp() async {
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
    helpes.add(Help.fromMap2(parsedJson[i]));
   }

    isLoading = false;
    notifyListeners();
    return helpes;
  }

  //LISTAR2 donaciones
  Future<List<Help>> listarHelp2() async {
    isLoading = true;
    helpes = [];
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
    helpes.add(Help.fromMap2(parsedJson[i]));
   }

    isLoading = false;
    notifyListeners();
    return helpes;
  }

  //VALIDAR
  Future crearOactualizar(Help help) async {
    isSaving = true;
    notifyListeners();

    if (help.id == null) {
      await crearHelp(help);
    } else {
      await actualizarHelp(help);
    }

    isSaving = false;
    notifyListeners();
  }

  //ACTUALIZAR donaciones
  Future actualizarHelp(Help help) async {
    print(help.id);
    final url = Uri.parse('$baseUrl?id=eq.${help.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.put(url, body: help.toJson2(), headers: header);
    final decodedData = response.body;
    final index = helpes.indexWhere((element) => element.id == help.id);
    helpes[index] = help;
    return help.id;
  }

  //CREAR donaciones
  Future<String> crearHelp(Help help) async {
    final url = Uri.parse(baseUrl);
    final String msg;
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.post(url, body: help.toJson(), headers: header);

    if(response.statusCode !=201){
      msg = 'no se creo';
    }else{
      msg = 'se creo';
      helpes.add(help);
    }
      return msg;
  }

  //BORRAR donaciones
  Future<String> borrarHelp(Help help) async {
    print(help.id);
    final url = Uri.parse('$baseUrl?id=eq.${help.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.delete(url,headers: header );
    helpes.remove(help);
    notifyListeners();
    return '${help.id!}';
  }
}