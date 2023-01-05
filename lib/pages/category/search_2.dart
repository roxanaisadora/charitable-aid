import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Building>> fetchBuildings(http.Client client) async {
  String baseUrl = 'https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/search';
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';



  final url = Uri.parse('$baseUrl?select=*');
    Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
    final response = await http.get(url,headers: header );

  // Use the compute function to run parseBuildings in a separate isolate.
  return compute(parseBuildings, response.body);
}

// A function that converts a response body into a List<Building>.
List<Building> parseBuildings(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Building>((json) => Building.fromJson(json)).toList();
}

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



class Search2List extends StatelessWidget {
  const Search2List({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('helo'),
      ),
      body: FutureBuilder<List<Building>>(
        future: fetchBuildings(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return BuildingsList(buildings: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class BuildingsList extends StatelessWidget {
  const BuildingsList({super.key, required this.buildings});

  final List<Building> buildings;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: buildings.length,
      itemBuilder: (context, index) {
        return Image.network(buildings[index].image);
      },
    );
  }
}