import 'package:ac/models/model_supabase_ayuda.dart';
import 'package:ac/pages/category/social_aid/time_screen.dart';
import 'package:ac/services/dato_supabase_help.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class VolunteerScreen extends StatelessWidget {
  final String? title;
  final String? image;
  final String? place;
  final String? hora;
  final String? place2;
  final String? description;
  final String? img1;
  final String? img2;
  final String? img3;
  final String? ong;
  final String? fecha;
  final double? latitud;
  final double? longitud;
  final int? asistiran;
  const VolunteerScreen({super.key, this.title, this.image, this.place, this.hora, this.description, this.img1, this.img2, this.img3, this.ong, this.latitud, this.longitud, this.asistiran, this.fecha, this.place2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 0.9,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          /* () {
                  print('back pressed');
                }, */
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey.shade500,
              size: 22.5,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                .copyWith(bottom: 5),
            child: Screen_2(
              title:title!,
              lugar:place!,
              image:image!,
              hora:hora!,
              description:description!,
              img1:img1!,
              img2:img2!,
              img3:img3!,
              ong:ong!,
              latitud:latitud!,
              longitud:longitud!,
              asistiran:asistiran!,
              fecha:fecha!,
              place2:place2!
            ),
          ),
        ),
      ),
      bottomSheet: JoinButton(
        img:image!,
        lugar:place!,
        dia:fecha!,
        hora:hora!,
        title:title!,
        
      ),
    );
  }
}

class Screen_2 extends StatelessWidget {
  final String? title;
  final String? lugar;
  final String? image;
  final String? hora;
  final String? description;
  final String? img1;
  final String? img2;
  final String? img3;
  final String? ong;
  final int? asistiran;
  final double latitud;
  final double longitud;
  final String? fecha;
  final String? place2;
  
  const Screen_2({super.key, this.title, this.lugar, this.image, this.hora, this.description, this.img1, this.img2, this.img3, this.ong, required this.latitud, required this.longitud, this.asistiran, this.fecha, this.place2});

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VolunteersPostImage(
                  asset:image!,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VolunteeringInfoChip(
                      label: '$ong',
                    ),
                    IconButton(
                      onPressed: (){
                          ()async{
                            final urlPreview = 'https://www.youtube.com/watch?v=tLJaHH5MAfg';
                            await Share.share('Ven y unete al cambio por el Perú\n\n$urlPreview');
                            //await Share.share('Ven y unete al cambio por el Perú\n\n$urlPreview');
                          };
                        },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Lugar: $lugar',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 15,
                ),
                VolunteersPostDetails(
                  date: 'dia:$fecha',
                  journey: 'hora:$hora',
                  
                ),
                const SizedBox(
                  height: 10,
                ),
                VolunteerAvatars(
                  firstAvatar:'$img1',
                  secondAvatar:'$img2',
                  thirdAvatar:'$img3',
                  volunteersNumber: asistiran,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('$description',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                LocationMap(
                  latitude:latitud,
                  longitude: longitud,
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            );
  }
}

class VolunteersPostDetails extends StatelessWidget {
  const VolunteersPostDetails({
    Key? key,
    required this.date,
    required this.journey,
  }) : super(key: key);
  final String date;
  final String journey;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VolunteeringInfoChip(
          label:  date,
        ),
        VolunteeringInfoChip(
          label: journey,
        ),
      ],
    );
  }
}

class LocationMap extends StatelessWidget {
  const LocationMap({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
          ),
          minMaxZoomPreference:const MinMaxZoomPreference(13, 18),
          markers: <Marker>{
            Marker(
              markerId: const MarkerId('marcador'),
              position: // LatLng(-11.445, -77.1),
                  LatLng(latitude, longitude),
              rotation: latitude,
              draggable: false,
              zIndex: 2,
              flat: true,
              anchor: const Offset(0.5, 0.5),
              icon: BitmapDescriptor.defaultMarker,
            )
          },
        ),
      ),
    );
  }
}

class VolunteersPostImage extends StatelessWidget {
  const VolunteersPostImage({
    Key? key,
    required this.asset,
  }) : super(key: key);
  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          asset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    this.number,
    required this.onPressed,
  }) : super(key: key);
  final String? number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              number ?? '0',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VolunteerAvatars extends StatelessWidget {
  const VolunteerAvatars({
    Key? key,
    required this.firstAvatar,
    required this.secondAvatar,
    required this.thirdAvatar,
    this.volunteersNumber,
  }) : super(key: key);
  final String firstAvatar;
  final String secondAvatar;
  final String thirdAvatar;
  final int? volunteersNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(
            firstAvatar,
          ),
        ),
        Positioned(
          left: 25,
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              secondAvatar,
            ),
          ),
        ),
        Positioned(
          left: 50,
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              thirdAvatar,
            ),
          ),
        ),
        Positioned(
          left: 90,
          child: Text(
            '$volunteersNumber Asistirán',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }
}

class JoinButton extends StatelessWidget {
  final String ? img;
  final String ? lugar;
  final String? dia;
  final String? hora;
  final String? title;
  const JoinButton({
    Key? key, this.img, this.lugar, this.dia, this.hora, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpService = Provider.of<HelpSeresvice>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ).copyWith(bottom: 25),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: Colors.green,
          onPressed: () {
              helpService.seleccionarLugar2 = Help(fecha: dia!, nombre: title!, hora:hora!);
              Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TimePage(
              img:img,
              lugar:lugar,
            ),
          ),
        );
          },
        child: const Text(
        'Ayudar ahora',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
        ),
      ),
    );
  }
}

class VolunteeringInfoChip extends StatelessWidget {
  const VolunteeringInfoChip({
    Key? key,
    required this.label,
    this.color = Colors.lightGreen,
  }) : super(key: key);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        //'Voluntariado',
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
