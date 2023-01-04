import 'dart:convert';
import 'package:ac/models/donation_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DonationPostSeresvice extends ChangeNotifier {
  final String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/info';
  final List<DonationPost> donationposts = [];
  late DonationPost seleccionarLugar2;
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';

  bool isLoading = true;
  bool isSaving = false;

  DonationPostSeresvice() {
    listarDonationPost();
  }

  //LISTAR donaciones
  Future<List<DonationPost>> listarDonationPost() async {
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
    donationposts.add(DonationPost.fromMap(parsedJson[i]));
   }

    isLoading = false;
    notifyListeners();
    return donationposts;
  }

  //VALIDAR
  Future crearOactualizar(DonationPost donationpost) async {
    isSaving = true;
    notifyListeners();

    if (donationpost.id == null) {
      await crearDonationPost(donationpost);
    } else {
      await actualizarDonationPost(donationpost);
    }

    isSaving = false;
    notifyListeners();
  }

  //ACTUALIZAR donaciones
  Future actualizarDonationPost(DonationPost donationpost) async {
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
    final index = donationposts.indexWhere((element) => element.id == donationpost.id);
    donationposts[index] = donationpost;
    return donationpost.id;
  }

  //CREAR donaciones
  Future<String> crearDonationPost(DonationPost donationpost) async {
    final url = Uri.parse(baseUrl);
    final String msg;
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
    final response = await http.post(url, body: donationpost.toJson(), headers: header);

    if(response.statusCode !=201){
      msg = 'no se creo';
    }else{
      msg = 'se creo';
      donationposts.add(donationpost);
    }
      return msg;
  }

  //BORRAR donaciones
  Future<String> borrarHelp(DonationPost donationpost) async {
    print(donationpost.id);
    final url = Uri.parse('$baseUrl?id=eq.${donationpost.id}');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.delete(url,headers: header );
    donationposts.remove(donationpost);
    notifyListeners();
    return '${donationpost.id}';
  }
}