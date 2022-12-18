
import 'package:flutter/material.dart';

class Card4 extends StatefulWidget {
  final String? image;
  final int? num1;
  final int? num2;
  final int? num3;
  final int? num4;
  final int? num5;
  final int? num6;
  final Function? onTap;
  const Card4({super.key, this.image, this.num1, this.num2, this.num3, this.num4, this.num5, this.num6, this.onTap});

  @override
  State<Card4> createState() => _Card4State();
}

class _Card4State extends State<Card4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: ()=> widget.onTap!(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 590,
          width: 340,
          child:Column(
            children: [
              Container(
                height: 350,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: Column(
                    children: [
                        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.num1} comidas', style: const TextStyle( fontSize: 15),),
                      Text(' + ${widget.num1}', style: const TextStyle( fontSize: 15),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('compartidas', style: TextStyle( fontSize: 12),),
                      Text('En los ultimos dias', style: TextStyle( fontSize: 12),),
                    ],
                  ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: Column(
                    children: [
                        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.num3} Contribuidres', style: const TextStyle( fontSize: 15),),
                      Text(' + ${widget.num4}', style: const TextStyle( fontSize: 15),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Combatiendo el hambre', style: TextStyle( fontSize: 12),),
                      Text('En los ultimos dias', style: TextStyle( fontSize: 12),),
                    ],
                  ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: Column(
                    children: [
                        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.num5} objetivo', style: const TextStyle( fontSize: 15),),
                      Text(' + ${widget.num6}', style: const TextStyle( fontSize: 15),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Completados', style: TextStyle( fontSize: 12),),
                      Text('En los ultimos 90 dias', style: TextStyle( fontSize: 12),),
                    ],
                  ),
                    ],
                  ),
                ),
                
            ],
          )

        ),
      ),
    );
  }
}