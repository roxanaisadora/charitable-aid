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
  final String? dia;
  final String? hora;
  const VolunteerScreen({super.key, this.title, this.image, this.place, this.dia, this.hora});

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
              dia:dia!,
              hora:hora!
            ),
          ),
        ),
      ),
      bottomSheet: JoinButton(
        img:image!,
        lugar:place!,
        dia:dia!,
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
  final String? dia;
  final String? hora;

  const Screen_2({super.key, this.title, this.lugar, this.image, this.dia, this.hora});

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
                      label: 'Voluntariado',
                    ),
                    FavoriteButton(
                      onPressed: () {},
                      number: '544',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Lugar: ${lugar}',
                  style: TextStyle(
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
                  date: 'dia:${dia}',
                  journey: 'hora:${hora}',
                  sharePressed:(){
                    ()async{
                      //final urlPreview = 'https://www.youtube.com/watch?v=tLJaHH5MAfg';
                      await Share.shareFiles(['${image}'], text: 'Ven y unete al cambio por el Perú');
                      //await Share.share('Ven y unete al cambio por el Perú\n\n$urlPreview');
                    };
                  }
                ),
                const SizedBox(
                  height: 10,
                ),
                VolunteerAvatars(
                  firstAvatar:
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                  secondAvatar:
                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  thirdAvatar:
                      'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  volunteersNumber: '50',
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'En la Playa Las orillas se necesita ayuda para limpiar las playas esperamos su colaboracion con esta causa, los interesados unirse a este evento y no se olviden de compartir.Gracias agentes del cambio.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                LocationMap(
                  latitude: -11.445,
                  longitude: -77.1,
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
    this.sharePressed,
    this.favouritePressed,
  }) : super(key: key);
  final String date;
  final String journey;
  final Function? sharePressed;
  final VoidCallback? favouritePressed;

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
        IconButton(
          onPressed: ()=>sharePressed!,
          icon: Icon(
            Icons.share,
            color: Colors.grey,
            size: 30,
          ),
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
            target: LatLng(-11.445, -77.1),
          ),
          minMaxZoomPreference: MinMaxZoomPreference(13, 18),
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
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              number ?? '0',
              style: TextStyle(
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
  final String? volunteersNumber;

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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        //'Voluntariado',
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
