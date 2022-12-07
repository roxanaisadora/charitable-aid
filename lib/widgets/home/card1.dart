

import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String? image;
  final String? title;
  final Function? onTap;
  const Card1({super.key, this.image, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
                        width:290.0,
                        decoration:  BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                              BoxShadow(
                              color: Color.fromARGB(255, 104, 104, 104),
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
                                  color: Colors.blue,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  ),
                                  image: DecorationImage(
                                image: NetworkImage(
                                  image!,
                                ),
                                fit: BoxFit.cover,
                              ),
                                ),
                                
                              )
                            ),
                            Expanded(child: Container(color: Colors.amber,width:double.infinity)),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                              child: InkWell(
                                onTap: ()=> onTap!(),
                                child: Container(
                                  decoration:  BoxDecoration(
                                    color: Colors.green,
                                  borderRadius: BorderRadius.circular(8)),
                                  width:double.infinity
                                  
                                  ),
                              ),
                            ))
                          ],
                        )
                      );
  }
}