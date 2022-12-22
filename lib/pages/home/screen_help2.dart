import 'dart:convert';
import 'package:ac/widgets/home/card5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SecreenHelp2 extends StatefulWidget {
  
  const SecreenHelp2({Key? key}) : super(key: key);

  @override
  State<SecreenHelp2> createState() => _SecreenHelp2State();
}

class _SecreenHelp2State extends State<SecreenHelp2> {
  List<dynamic>  _items2 = [];
  YoutubePlayerController? _controller;
  static const postTitle = 'Sigue nuestro paso a paso';
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
      initialVideoId: '3Kwwetsr54A',// https://www.youtube.com/watch?v=Tb9k9_Bo-G4
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(postTitle,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('La campaña de donación “Ayúdanos a ayudar”, logró atender a más de 900 mil familias vulnerables de Lima y del interior del país con víveres de primera necesidad, durante los meses más críticos de la pandemia de covid-19.\n\nEsta cantidad de beneficiarios supera con creces la meta trazada, 30 mil familias, logro que fue destacado por el viceministro de Políticas para la Defensa, Manuel Mesones Castelo. “Este es un ejemplo de las cosas que se pueden hacer cuando el sector público, sector privado, iglesia y medios de comunicación se unen. Cuando todos nos unimos, cuando tenemos una meta común, podemos hacer cosas espectaculares”, afirmó.\n\n Hombro a Hombro por su compromiso en beneficio de las poblaciones más vulnerables ante la pandemia. La campaña fue ejecutada de abril a julio del presente año.\n\nTambién felicitó al personal de las Fuerzas Armadas, gracias al cual se ha podido llegar a cada uno de los hogares de las familias beneficiarias, tanto en Lima, como en las distintas regiones del país. “Nuestro reconocimiento y agradecimiento al sacrificio de las Fuerzas Armadas, cuyos miembros han estado expuestos a la enfermedad y aun así siguen poniendo el pecho para apoyar a la población”, afirmó.\nLa estrategia de apoyo social consistió en la recaudación de fondos, con los cuales se ha podido adquirir canastas de víveres de primera necesidad. Al mismo tiempo, numerosas empresas privadas y la población en general donaron víveres o animales vivos.'),
                ),
                SizedBox(height: 20),
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
              SizedBox(height: 30)
              ],
            ),
          ),
        );
      },
    );
  }

}