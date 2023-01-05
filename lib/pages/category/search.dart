import 'dart:developer';
import 'package:ac/pages/category/social_aid/volunteer_screen.dart';
import 'package:ac/services/search_supabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Building {
  String? id;
  String? name;
  String? place;
  String? image;
  String? hora;
  String? fecha;

  Building({this.id, this.name, this.place, this.image, this.hora, this.fecha});
}

class SearchList extends StatefulWidget {
  SearchList({Key? key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text(
    "Search...",
    style: TextStyle(color: Colors.black),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.blue,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Building> _list = [];
  List<Building> _searchList = [];

  late bool _IsSearching;
  String _searchText = "";

  @override
  void initState() {
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
  }

  

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    final Searchservice = Provider.of<SearchSeresvice>(context);
    print(Searchservice.searchpost);
    //_list= Searchservice.searchpost;
    return Scaffold(
      key: key,
      appBar: AppBar(
          centerTitle: true,
          title: appBarTitle,
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
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
        color: Color.fromARGB(126, 105, 240, 175),
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

  List<Building> _buildList() {
    return _list;
  }

  List<Building> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list
          .where((element) =>
              element.name!.toLowerCase().contains(_searchText.toLowerCase()) ||
              element.place!.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
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

  Widget build(BuildContext context) {
    return CardSearch(
      image: building.image!,
      place: building.place!,
      title: building.name!,
      onTap: () {
        final route = MaterialPageRoute(
          builder: (context) => VolunteerScreen(
            title: building.name!,
            image: building.image!,
            place: building.place!,
            dia: building.fecha!,
            hora: building.hora!,
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
              color:Color.fromARGB(255, 254, 251, 254),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                    child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                )),
              ),
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 65, 86, 242),
                borderRadius: const BorderRadius.only(
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
