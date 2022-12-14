

import 'package:flutter/material.dart';

class Card2 extends StatefulWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? titleb;
  final Function? onTap;
  const Card2({super.key, this.image, this.title, this.subtitle, this.titleb, this.onTap});

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 200,
                decoration:  BoxDecoration(
                  color: Colors.white,
                   borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    Expanded(
                      child:SizedBox(
                        height: double.infinity, 
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 35),
                            child: Image.asset(widget.image!),
                          ),
                        )
                      ),
                    Expanded(flex:2,
                    child:SizedBox(
                      height: double.infinity, 
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10, top:20, bottom: 10),
                        child: Column(
                          children: [
                          Text(widget.title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          const SizedBox(height: 8,),
                          SizedBox(height: 50, child: Text(widget.subtitle!,style: const TextStyle(fontSize: 16))),
                          InkWell(
                            onTap: ()=> widget.onTap!(),
                            child:Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30, left: 30),
                                child: Container(
                                  color:Colors.green, 
                                  height: 30, 
                                  width: double.infinity,
                                  child: Center(child: Text(widget.titleb!,style: const TextStyle(fontSize: 16, color: Colors.white))),
                                  ),
                              ),
                              )
                            )
                          ]),
                      ),
                    )
                    ),
                  ],
                )
              ),
            );
  }
}