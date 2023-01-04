
import 'package:ac/widgets/home/card5.dart';
import 'package:flutter/material.dart';


class SecreenMore2 extends StatelessWidget {
  final List data;
  final String? title;
  final String? img;
  final String? subtitle;
  final String? sub_title;
  const SecreenMore2({super.key, this.title, this.img, required this.data, this.subtitle, this.sub_title,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                  img!),
                  fit: BoxFit.fill,
                ),
              ),

             ),
             SizedBox(height: 15),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(title!,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
             ),
             SizedBox(height: 25),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(subtitle!),
             ),
             SizedBox(height: 15),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(sub_title!),
             ),
            SizedBox(height: 20),
             Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: SizedBox(height: 200, 
                    child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {  
                        final dato = data[index];
                          return Card5(
                            image: dato.image,
                          );
                      },
                  )
                ),
              ),
            SizedBox(height: 25),
            ],
          ),
        ),
      );
      
  }
}