import 'package:ac/widgets/home/card1.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        color: Colors.greenAccent,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 28, bottom: 10, right: 15, left: 15),
              child: Center(child: Text('Hola agente de cambio',style: TextStyle(fontSize: 20),)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
              child: Center(child: Text('Con solo 1.00 sol, puedes ayudar a muchas instituciones beneficas',style: TextStyle(fontSize: 16),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 340.0,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card1(
                        image:'https://justgive.files.wordpress.com/2012/08/helpkids1.png',
                        title: '',
                        onTap: (){},
                      ),
                      const SizedBox(width: 10,),
                      Card1(
                        image:'https://justgive.files.wordpress.com/2012/08/helpkids1.png',
                        title: '',
                        onTap: (){},
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width:280.0,
                        decoration:  BoxDecoration(
                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                      ),
                     
                    ],
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 250,
                decoration:  BoxDecoration(
                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Entry B')),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 250,
                decoration:  BoxDecoration(
                          color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Entry B')),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
              child: Container(
                decoration:  BoxDecoration(
                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                child: Container(
                  height: 200.0,
                  child: PageIndicatorContainer(
                    key: key,
                    child: PageView(
                      children: <Widget>[
                        Center(child: Text('1',style: TextStyle(fontSize: 20),)),
                        Center(child: Text('2',style: TextStyle(fontSize: 20),)),
                        Center(child: Text('3',style: TextStyle(fontSize: 20),)),
                        Center(child: Text('4',style: TextStyle(fontSize: 20),)),
                      ],
                      controller: controller,
                    ),
                    align: IndicatorAlign.bottom,
                    length: 4,
                    indicatorSpace: 10.0,
                    indicatorColor: Colors.white,
                    indicatorSelectorColor: Colors.blue,
              ),
          ),
        ),
            ),
          ],
        ),
      )
    );
  }
}
Widget buildPage(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        color: color,
        child: Center(child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white),),),
      ),
    );
  }
