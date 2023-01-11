import 'dart:convert';
import 'package:ac/models/donation_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DonationPostSeresvice extends ChangeNotifier {
  final String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/info';
  List<DonationPost> donationposts = [];
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

  //LISTAR2 donaciones
  Future<List<DonationPost>> listarDonationPost2() async {
    isLoading = true;
    notifyListeners();
    print('entro a listar');
    final url = Uri.parse('$baseUrl?select=*');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
      donationposts = [];
      final response = await http.get(url,headers: header );
      dynamic parsedJson = json.decode(response.body);

      for (var i = 0; i < parsedJson.length; i++){
        donationposts.add(DonationPost.fromMap(parsedJson[i]));
      }

    isLoading = false;
    notifyListeners();
    print (donationposts);
    return donationposts;
  }



 

}