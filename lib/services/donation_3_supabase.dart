import 'dart:convert';
import 'package:ac/models/donation_post_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DonationPostSeresvice3 extends ChangeNotifier {
  final String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/items_3';
  final List<DonationPost3> donationpost3s = [];
  late DonationPost3 seleccionarLugar2;
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';

  bool isLoading = true;
  bool isSaving = false;

  DonationPostSeresvice3() {
    listarDonationPost();
  }

  //LISTAR donaciones
  Future<List<DonationPost3>> listarDonationPost() async {
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
    donationpost3s.add(DonationPost3.fromMap(parsedJson[i]));
   }

    isLoading = false;
    notifyListeners();
    return donationpost3s;
  }

  //VALIDAR
  Future crearOactualizar(DonationPost3 donationpost) async {
    isSaving = true;
    notifyListeners();

    await actualizarDonationPost(donationpost);

    isSaving = false;
    notifyListeners();
  }

  //ACTUALIZAR donaciones
  Future actualizarDonationPost(DonationPost3 donationpost) async {
    print(donationpost.id);
    final url = Uri.parse('$baseUrl?id=eq.${donationpost.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.put(url, body: donationpost.toJson(), headers: header);
    final decodedData = response.body;
    final index = donationpost3s.indexWhere((element) => element.id == donationpost.id);
    donationpost3s[index] = donationpost;
    return donationpost.id;
  }


  //BORRAR donaciones
  Future<String> borrarHelp(DonationPost3 donationpost) async {
    print(donationpost.id);
    final url = Uri.parse('$baseUrl?id=eq.${donationpost.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.delete(url,headers: header );
    donationpost3s.remove(donationpost);
    notifyListeners();
    return '${donationpost.id}';
  }
}