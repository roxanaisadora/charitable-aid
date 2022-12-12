

import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter/material.dart';

class Card1 extends StatefulWidget {
  final String? image;
  final String? title;
  final double? colaboradores;
  final double? meta;
  final int? personas;
  final int? donadores;
  final Function? onTap;
  const Card1({super.key, this.image, this.title, this.onTap, this.colaboradores, this.meta, this.personas, this.donadores});

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  double percent = 10;
  
  void porcentaje(){
   double colab = widget.colaboradores as double;
   double met = widget.meta as double;
   double rest = (100 * colab)/met;
   percent = double.parse(rest.toStringAsFixed(2));
  }

  @override
  void initState() {
    super.initState();
    porcentaje();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width:300.0,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
              BoxShadow(
              color: Color.fromARGB(255, 190, 226, 186),
              offset: Offset(5.0,5.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex:3,
              child: Container(
                width:double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ),
            Expanded(
              child: Container(
              width:double.infinity,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 6),
                    child: Text(widget.title!, style: const TextStyle(fontSize: 23),),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('${widget.colaboradores} de ${widget.meta} ', style: const TextStyle(fontSize: 15),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('$percent %', style: const TextStyle(fontSize: 15),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RoundedProgressBar(
                      height: 10,
                      percent: percent,
                      theme: RoundedProgressBarTheme.purple),
                  ),
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('${widget.donadores} donadores y ${widget.personas} colaboradores', style: const TextStyle(fontSize: 15),),
                      ),
                ],
              )
              )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: InkWell(
                onTap: ()=> widget.onTap!(),
                child: Container(
                  height: 30,
                  decoration:  BoxDecoration(
                    color: Color.fromARGB(255, 106, 81, 119),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width:double.infinity,
                  child: const Center(child: Text('Ayudar ahora',style: TextStyle(fontSize: 16, color: Colors.white))),
                  ),
              ),
            )
          ],
        )
      ),
    );
  }
}