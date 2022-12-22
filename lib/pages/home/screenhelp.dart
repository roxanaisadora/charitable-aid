import 'dart:convert';

import 'package:ac/pages/category/social_aid/widgets/rounded_button.dart';
import 'package:ac/widgets/home/card5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SecreenHelp extends StatefulWidget {
  
  const SecreenHelp({Key? key}) : super(key: key);

  @override
  State<SecreenHelp> createState() => _SecreenHelpState();
}

class _SecreenHelpState extends State<SecreenHelp> {
   List<dynamic>  _items2 = [];
  YoutubePlayerController? _controller;
  static const postTitle = 'Un poco de tu ayuda cambia al Perú';
  Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/json/listhome.json');
  final data = await json.decode(response);
    setState(() {
      _items2 = data["items_5"];
    });
  }


  @override
  void initState() {
    super.initState();
    readJson();
    _controller = YoutubePlayerController(
      initialVideoId: '-qGOjuAoKYE',// https://www.youtube.com/watch?v=Tb9k9_Bo-G4
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar() ,
          body: SingleChildScrollView(
            child: Column(
              children: [
                player,
                SizedBox(height: 25),
                Text(postTitle,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Donar con nosotros es un de las mejores maneras de ayudar al projimo, aquí en AC brindamos distintos tipos de ayuda, ya sea donar a una ONG, algún hogar de niños, iglesia, comedor popular o una institución, hacer una donación no solo beneficia a personas y familias en situación de pobreza, sino también puede ser muy gratificante para usted, porque con un aporte por muy grande o pequeño que sea, cualquier tipo de caridad se considera un acto noble, que nos enriquece y nos hace crecer como personas, brindamos el recojo de donaciones de forma gratuita y a domicilio.\nQuizá cuenta con poco espacio en su hogar y tiene acumulado objetos en desuso, puede ponerse en contacto con nostros los traperos de emaus y dar solución a sus problemas de espacio, además estará contribuyendo con el medio ambiente, ya que también recogemos material reciclable con ello recaudamos fondos para poder financiar las accioones sociales que venimos realizando.\na continuación podrá observar en que se han ido transformando sus donaciones:'),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: SizedBox(height: 200, 
              child: ListView.builder(
                      itemCount: _items2.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {  
                        final dato = _items2[index];
                          return Card5(
                            image: dato['image'],
                          );
                      },
                      )
              ),
                ),
              SizedBox(height: 20)
              ],
            ),
          ),
        );
      },
    );
  }

}