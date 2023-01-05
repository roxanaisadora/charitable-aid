import 'package:ac/pages/category/social_aid/markers.dart';
import 'package:ac/providers/geo_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HelpPointsScreen extends StatefulWidget {
  const HelpPointsScreen({super.key});

  @override
  State<HelpPointsScreen> createState() => _HelpPointsScreenState();
}

class _HelpPointsScreenState extends State<HelpPointsScreen> {
  final _pageController = PageController();
  int? _selectedIndex;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  List<Marker> getHelpPointsMarker() {
    final _markerList = <Marker>[];
    for (int i = 0; i < helpPointsList.length; i++) {
      final helpPointMarker = helpPointsList[i];

      _markerList.add(
        Marker(
          markerId: MarkerId(helpPointMarker.pointName),
          position: helpPointMarker.location,
          onTap: () {
            setState(() {
              _selectedIndex = i;
              print(' estamos en = ${helpPointMarker.pointName}');
              _pageController.animateToPage(i,
                  duration: const Duration(microseconds: 400),
                  curve: Curves.elasticOut);
            });
          },
          icon: markerIcon,
        ),
      );
    }
    return _markerList;
  }

  @override
  void initState() {
    customMarker();
    super.initState();
  }

  void customMarker() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 2,
        size: Size(2, 2),
      ),
      "assets/icon/marker.png",
    ).then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final geoProvider = Provider.of<GeoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            geoProvider.activeMenu();
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Puntos de Acopio'),
        //backgroundColor: Colors.greenAccent,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: geoProvider.initialPosition,
              zoomGesturesEnabled: true,
              mapToolbarEnabled: false,
              markers: getHelpPointsMarker().toSet(),
              /* markers: Set.of(
                  (geoProvider.marker != null) ? [geoProvider.marker!] : []),
              circles: Set.of(
                  (geoProvider.circle != null) ? [geoProvider.circle!] : []), */
              onMapCreated: (GoogleMapController controller) {
                geoProvider.googleMapController = controller;
              },
            ),
          ),
          Visibility(
            visible: geoProvider.isVisible,
            child: FloatingActionButton(
              onPressed: () {
                geoProvider.getLocationUser();
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.location_searching),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.16,
            left: 15,
            right: 15,
            bottom: 20,
            child: PageView.builder(
              controller: _pageController,
              itemCount: helpPointsList.length,
              itemBuilder: (context, index) {
                final helpPoint = helpPointsList[index];
                return HelpLocationCard(
                  asset: helpPoint.asset,
                  pointName: helpPoint.pointName,
                  pointAddress: helpPoint.pointAddress,
                  schedule: helpPoint.schedule,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HelpLocationCard extends StatelessWidget {
  const HelpLocationCard({
    Key? key,
    required this.asset,
    required this.pointName,
    required this.pointAddress,
    required this.schedule,
    this.onTap,
  }) : super(key: key);
  final String asset;
  final String pointName;
  final String pointAddress;
  final String schedule;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            // 'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
            asset,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                //  'Casa Hogar',
                pointName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: /* () {
                debugPrint('close');
              }, */
                  onTap,
              child: const Icon(Icons.clear_rounded),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              //'Av.El ejercito 243',
              pointAddress,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Text(
              'Horario: $schedule',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
      ),
    );
  }
}
