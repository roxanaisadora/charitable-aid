import 'package:flutter/material.dart';

class Card5 extends StatefulWidget {
  final String? image;
  const Card5({super.key, this.image});

  @override
  State<Card5> createState() => _Card5State();
}

class _Card5State extends State<Card5> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width:200.0,
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
              child: Stack(
                children: [
                  const Center(child: CircularProgressIndicator()),
                  Container(
                    width:double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}