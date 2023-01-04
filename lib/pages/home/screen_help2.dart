
import 'package:ac/widgets/home/card5.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SecreenHelp2 extends StatefulWidget {
  final String youtubetext;
  final String postTitle;
  final String description;
  final List datoimage;

  const SecreenHelp2({Key? key, required this.youtubetext, required this.postTitle, required this.description, required this.datoimage}) : super(key: key);

  @override
  State<SecreenHelp2> createState() => _SecreenHelp2State();
}

class _SecreenHelp2State extends State<SecreenHelp2> {

  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubetext,// https://www.youtube.com/watch?v=Tb9k9_Bo-G4
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
                  child: Text(widget.postTitle,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.description),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: SizedBox(height: 200, 
              child: ListView.builder(
                      itemCount: widget.datoimage.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {  
                        final dato = widget.datoimage[index];
                          return Card5(
                            image: dato.image,
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