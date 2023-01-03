import 'package:flutter/material.dart';

class CardBuy extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget? image;
  const CardBuy({super.key, required this.title, required this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 220, 221, 223), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15))
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const Center(child: CircularProgressIndicator()),
                    SizedBox(height: 80,
                      child: image!
                    ),
                  ],
                )
              ),
              Expanded(flex:3,
                child: SizedBox(height: 260,
                  child:Padding(
                    padding: const EdgeInsets.only(right: 10,left:15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title!, 
                        style: const TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 7,),
                        Text(description!)
                      ],
                    ),
                  )
                )
              ),
            ],
          ),
    );
  }
}