import 'dart:convert';
import 'package:ac/models/modelo_supabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DonationesService extends ChangeNotifier {
  final String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/prototipo';
  final List<Donation> donationes = [];
  late Donation seleccionarLugar;
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';

  bool isLoading = true;
  bool isSaving = false;

  DonationesService() {
    listarDonationes();
  }

  //LISTAR donaciones
  Future<List<Donation>> listarDonationes() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('$baseUrl?select=*');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.get(url,headers: header );
    dynamic parsedJson = json.decode(response.body);

   for (var i = 0; i < parsedJson.length; i++){
    donationes.add(Donation.fromMap2(parsedJson[i]));
   }

    isLoading = false;
    notifyListeners();
    return donationes;
  }

  //VALIDAR
  Future crearOactualizar(Donation donation) async {
    isSaving = true;
    notifyListeners();

    if (donation.id == null) {
      await crearDonation(donation);
    } else {
      await actualizarDonation(donation);
    }

    isSaving = false;
    notifyListeners();
  }

  //ACTUALIZAR donaciones
  Future actualizarDonation(Donation donation) async {
    print(donation.id);
    final url = Uri.parse('$baseUrl?id=eq.${donation.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.put(url, body: donation.toJson2(), headers: header);
    final decodedData = response.body;
    final index = donationes.indexWhere((element) => element.id == donation.id);
    donationes[index] = donation;
    return donation.id;
  }

  //CREAR donaciones
  Future<String> crearDonation(Donation donation) async {
    final url = Uri.parse(baseUrl);
    final String msg;
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.post(url, body: donation.toJson(), headers: header);

    if(response.statusCode !=201){
      msg = 'no se creo';
    }else{
      msg = 'se creo';
      donationes.add(donation);
    }
      return msg;
  }

  //BORRAR donaciones
  Future<String> borrarDonation(Donation donation) async {
    print(donation.id);
    final url = Uri.parse('$baseUrl?id=eq.${donation.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.delete(url,headers: header );
    donationes.remove(donation);
    notifyListeners();
    return '${donation.id}';
  }
}