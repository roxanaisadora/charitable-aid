import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ac/pages/category/social_aid/volunteer_screen.dart';

Future<List<Building>> fetchPhotos(http.Client client) async {
  String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  String autorizacion = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwanV1eXl2YnFsam1vZW9qd2FnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwNTM4MDIsImV4cCI6MTk4NjYyOTgwMn0.6lULs4mfwr7jw4nBNFCmGjEPxD90rsL5ZPAq4rJVP2o';
  Map<String,String> header = {
        'apikey':apikey,
        'Authorization':autorizacion,
      };
  final response = await client
      .get(Uri.parse('https://qpjuuyyvbqljmoeojwag.supabase.co/rest/v1/search?select=*'),headers: header);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Building> parsePhotos(String responseBody) {
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
      body: FutureBuilder<List<Building>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const  Material(
              color: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatefulWidget {
  const PhotosList({super.key, required this.photos});

  final List<Building> photos;

  @override
  State<PhotosList> createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  Widget appBarTitle = const Text(
    "Search...",
    style: TextStyle(color: Colors.black),
  );
  Icon actionIcon =const Icon(
    Icons.search,
    color: Colors.blue,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
    late bool _IsSearching;
  String _searchText = "";
  List<Building> _list = [];
  List<Building> _searchList = [];

  @override
  void initState() {
    //print(widget.photos);
    super.initState();
    _IsSearching = false;
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
    init();
  }

  void init(){
    //print('entro');
    _list = [];
    _list =  widget.photos; 
    _searchList = _list;
    //print('-----------------------');
    log('$_searchList'); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: appBarTitle,
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = const Icon(
                      Icons.close,
                      color: Colors.red,
                    );
                    appBarTitle = TextField(
                      controller: _searchQuery,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Buscar...",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(59, 0, 0, 0))),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              },
            ),
          ]),
         body: Container(
          color: const Color.fromARGB(126, 105, 240, 175),
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GridView.builder(
              itemCount: _searchList.length,
              itemBuilder: (context, index) {
                return Uiitem(_searchList[index]);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
              )),
        ),
      ),
    );
  }

  // ignore: unused_element
  List<Building> _buildList() {
    return _list;
  }

  List<Building> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
              element.place.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      // ignore: avoid_print
      //print('${_searchList.length}');
      return _searchList;
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.blue,
      );
      appBarTitle = const Text(
        "Buscar...",
        style: TextStyle(color: Colors.black),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class Uiitem extends StatelessWidget {
  final Building building;
  const Uiitem(this.building, {super.key});

  @override
  Widget build(BuildContext context) {
    return CardSearch(
      image: building.image,
      place: building.place,
      title: building.name,
      onTap: () {
        final route = MaterialPageRoute(
          builder: (context) => VolunteerScreen(
            title: building.name,
            image: building.image,
            place: building.place,
            hora: building.hora,
            description: building.description,
            img1: building.img1,
            img2: building.img2,
            img3: building.img3,
            ong: building.ong,
            latitud: building.latitud,
            longitud: building.longitud,
            asistiran:building.asistiran,
            fecha:building.fecha,
            place2:building.place2,
          ),
        );
        Navigator.push(context, route);
      },
    );
  }
}

class CardSearch extends StatelessWidget {
  final String? image;
  final String? place;
  final String? title;
  final Function? onTap;
  const CardSearch({super.key, this.image, this.place, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => onTap!(),
              child: SizedBox(
                height: 190,
                width: 250,
                child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      PhysicalModel(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                        child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: image!,
                              fit: BoxFit.cover,
                              height: 190,
                              width: 250,
                            ),
                      ),
                    ],
                  ),

                ),
              ),
            Container(
              width: double.infinity,
              height: 45,
              color:const Color.fromARGB(255, 254, 251, 254),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                    child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                )),
              ),
            ),
            Container(
              height: 30,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 65, 86, 242),
                borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: place!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 253, 249, 249),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
