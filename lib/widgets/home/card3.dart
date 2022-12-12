
import 'package:flutter/material.dart';

class Card3 extends StatefulWidget {
  final String? image;
  final String? title;
  const Card3({super.key, this.image, this.title});

  @override
  State<Card3> createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () { },
        child: Container(
          height: 520,
          width: 340,
          child:Stack(
            children: [
              Container(
                height: 520,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.image!),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
              Stack(
                children: [
                  Container(
                    height: 520,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: const Alignment(0.0, 1.0), // 10% of the width, so there are ten blinds.
                      colors: <Color>[
                        const Color.fromARGB(255, 14, 14, 14),
                        const Color.fromARGB(255, 51, 50, 50).withOpacity(0.1),
                        const Color.fromARGB(16, 13, 13, 13).withOpacity(0.001),
                      ], // red to yellow // repeats the gradient over the canvas
                    ),
                  ),
                  )
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top:10),
                    child: Text(widget.title!, style: const TextStyle(color: Colors.white, fontSize: 25),),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(child: Text('Conocer ahora',style: TextStyle(color: Colors.white, fontSize: 17))),
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              )
            ],
          )

        ),
      ),
    );
  }
}