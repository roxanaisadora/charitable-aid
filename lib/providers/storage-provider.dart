
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class StorageHomeProvider extends ChangeNotifier{
  File? image;
  String?nameImage;
  String urlbase = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/usuarios';
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';

  //supabase
  final SupabaseClient client = SupabaseClient('https://qpjuuyyvbqljmoeojwag.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o');

  //subir imagen a supabase
  Future uploadimage()async{
    final file = File(image!.path);
    final ruta0 = '/data/user/0/com.example.sesion_09/cache/$nameImage';
    final ruta1=image!.path.replaceAll(
      '/data/user/0/com.example.sesion_09/cache', 
      'IMG');
    final ruta2=image!.path.replaceAll(
      '/data/user/0/com.example.sesion_09/app_flutter', 
      'IMG');
    final newPath = (image!.path == ruta0)?ruta1:ruta2;
    final response = await client.storage.from('usuarios').upload(newPath, file);

    print(response);

    notifyListeners();
  }

  //************************************************************* 
    //API
    Future <String> guardarDB() async{
      final url = Uri.parse(urlbase);
      final String msg;
      Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      };
      final body = jsonEncode({
        'nombre':'prueba01',
        'img':nameImage
      });
      final response = await http.post(url, body:body, headers: header);

      if(response.statusCode !=201){
        print('no se guardo');
        msg = 'no se guardo';
      }else{
        print(' se guardo');
        msg = 'se guardo';
        uploadimage();
      }

      return msg;
    }

  //*************************************************************

  //camara 
  Future activecamera()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if(image==null)return;

    final imagetemporal = File(image.path);

    //nombre del archivo
    nameImage = image.name;
    this.image = imagetemporal;
    notifyListeners();
    guardarDB();
  }

  //galeria
  Future activegallery()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image==null)return;

    final imagetemporal = File(image.path);

    //nombre del archivo
    nameImage = image.name;
    this.image = imagetemporal;
    notifyListeners();
    guardarDB();
  }

  //limpiar imagen

  Future activeClean()async{
    image= null;
    notifyListeners();
  }



}