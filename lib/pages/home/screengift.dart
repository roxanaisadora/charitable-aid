import 'package:ac/pages/category/social_aid/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Secreen2 extends StatefulWidget {
  
  const Secreen2({Key? key}) : super(key: key);

  @override
  State<Secreen2> createState() => _Secreen2State();
}

class _Secreen2State extends State<Secreen2> {
  YoutubePlayerController? _controller;
  static const category = 'ayuda social';
  static const donationAmount = 3.00;
  static const postTitle = 'Ayuda Lima';
  static const postAsset = 'https://i.ibb.co/z8HzMmd/Captura.png';
  static const qr1 = 'https://w7.pngwing.com/pngs/619/184/png-transparent-qr-code-barcode-scanners-scanner-q-text-rectangle-logo.png';
  static const qr2 = 'https://w7.pngwing.com/pngs/223/1014/png-transparent-qr-code-qr-code-barcode-itf-14-number-rain-barcode-miscellaneous-text-rectangle.png';
  static const qr3 = 'https://w7.pngwing.com/pngs/619/184/png-transparent-qr-code-barcode-scanners-scanner-q-text-rectangle-logo.png';
  static const socio = 'Maria Pardo';
  static const numero = 93658965;
  
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: '8KiM9MbEfSo',// https://www.youtube.com/watch?v=Tb9k9_Bo-G4
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
          appBar: AppBar(
            title: const Text("Enviar Regalo"),
          ) ,
          body: SingleChildScrollView(
            child: Column(
              children: [
                player,
                SizedBox(height: 25),
                Text(postTitle,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('El hambre no es un virus que se propague por contagio, pero es una enfermedad que avanza, se extiende y afecta ya a una octava parte del planeta.\nEl último informe de la ONU sobre el estado del hambre en el mundo indica que casi el 10% de la población mundial, 811 millones de personas, sufrieron hambre en 2020, 118 millones más que en 2019. La desnutrición mata a 3,1 millones de niñas y niños menores de 5 años cada año, es decir alrededor de 8,500 vidas cada día.\n¡Tu ayuda es vital para luchar contra el hambre y la desnutrición!'),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: RoundedButton(
                    onPressed: () {},
                    category:category,
                    donationAmount:donationAmount,
                    postTitle:postTitle,
                    img:postAsset,
                    qr1: qr1,
                    qr2:qr2,
                    qr3:qr3,
                    socio:socio,
                    numero:numero,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}