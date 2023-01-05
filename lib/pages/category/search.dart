import 'dart:developer';
import 'package:ac/pages/category/social_aid/volunteer_screen.dart';
import 'package:flutter/material.dart';
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
    init();
  }

  void init() {
    _list = [];
    _list.add(
      Building(
          id: "1",
          name: "Limpieza de rio",
          place: "tacna",
          image:
              "https://www.nacion.com/resizer/8dEq4reQK4EzH-m4DA8PzSwniYw=/1440x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/gruponacion/KTKDRMG3KREONAZFL5UN2W4DME.jpeg",
          fecha: "01/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "2",
          name: "Recojo de viveres",
          place: "ica",
          image: "https://donacioneslimaperu.org.pe/images/2020/09/15/6.jpeg",
          fecha: "11/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "3",
          name: "Voluntariado para chocolatada",
          place: "apurimac",
          image:
              "http://www.usat.edu.pe/web/wp-content/uploads/2014/12/chocolatada1.jpg",
          fecha: "06/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "4",
          name: "Limpieza de colegio",
          place: "lima",
          image:
              "https://portal.andina.pe/EDPfotografia3/Thumbnail/2017/04/01/000414032W.jpg",
          fecha: "14/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "5",
          name: "Cuidado de asilo",
          place: "apurimac",
          image:
              "https://www.guatemala.com/fotos/201705/PORTADA-ASILOS-885x500.jpg",
          fecha: "01/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "6",
          name: "Ayuda en comedor popular",
          place: "cajamarca",
          image:
              "https://www.prisma.org.pe/wp-content/uploads/PORTADA-COSUDE-800x480.jpg",
          fecha: "03/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "7",
          name: "Ayuda contra el frio",
          place: "puno",
          image:
              "https://files.adventistas.org/noticias/es/2016/07/05093416/13580508_1133170520051903_3430511184546362842_o-617x450.jpg",
          fecha: "07/02/2023",
          hora: "7:00 - 14:00"),
    );
    _list.add(
      Building(
          id: "8",
          name: "Limpieza de rio",
          place: "callao",
          image: "https://static.dw.com/image/50575840_101.jpg",
          fecha: "01/02/2023",
          hora: "7:00 - 15:00"),
    );
    _list.add(
      Building(
          id: "9",
          name: "Ayuda con chocolatada",
          place: "ica",
          image:
              "https://peru21.pe/resizer/4W3F0RqkKTLRC4JLVSj743us-Ug=/1200x675/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/WZPMHC5M4FFK7HXCB7ASFB7EUE.jpg",
          fecha: "03/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "17",
          name: "Ayuda en comedor popular",
          place: "callao",
          image:
              "https://portal.andina.pe/EDPfotografia3/Thumbnail/2021/03/12/000756645W.jpg",
          fecha: "05/02/2023",
          hora: "7:00 - 13:00"),
    );
    _list.add(
      Building(
          id: "10",
          name: "Ayuda a pueblo joven",
          place: "lima",
          image:
              "https://www.chimbotenlinea.com/sites/default/files/styles/grande/public/field/image/ayuda_a_ancianos_en_chimbote.jpeg?itok=CufNZrKc",
          fecha: "06/02/2023",
          hora: "7:00 - 12:00"),
    );
    _list.add(
      Building(
          id: "11",
          name: "Ayuda en recojo",
          place: "puno",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI2e6tJ_sZnruIsU2S1YLFrgC-w2LbxkVNZKNgfoaCMTOYsIClq_DmOaALd6Uc8rzMR50&usqp=CAU",
          fecha: "08/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "12",
          name: "Limpieza de playa",
          place: "lima",
          image:
              "https://www.bbva.com/wp-content/uploads/2018/10/Limpieza-de-Playas2-1024x683.jpg",
          fecha: "01/02/2023",
          hora: "7:00 - 12:00"),
    );
    _list.add(
      Building(
          id: "13",
          name: "Ayuda en albergue",
          place: "puno",
          image:
              "https://web.ins.gob.pe/sites/default/files/noticias/atenci%C3%B3nmedicaalbergue.jpg",
          fecha: "01/02/2023",
          hora: "7:00 - 15:00"),
    );
    _list.add(
      Building(
          id: "14",
          name: "Ayuda en asilo",
          place: "cajamarca",
          image: "https://www.guatemala.com/fotos/201708/portada-3-885x500.jpg",
          fecha: "09/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "15",
          name: "Recojo de viveres",
          place: "tarapoto",
          image:
              "https://portal.andina.pe/EDPfotografia3/Thumbnail/2017/06/10/000427081W.jpg",
          fecha: "16/02/2023",
          hora: "7:00 - 11:00"),
    );
    _list.add(
      Building(
          id: "16",
          name: "Enseñanza en colegio",
          place: "ayacucho",
          image:
              "https://cdn.www.gob.pe/uploads/document/file/312609/standard_directoreducacionrural080519.jpg",
          fecha: "20/02/2023",
          hora: "7:00 - 11:00"),
    );

    _searchList = _list;
    log('$_searchList');
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      key: key,
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
              element.name!.toLowerCase().contains(_searchText.toLowerCase()) ||
              element.place!.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      // ignore: avoid_print
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

  @override
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
