import 'package:ac/widgets/home/card1.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  // ignore: prefer_final_fields
  List<dynamic> _data = [
    {
      'image':'https://justgive.files.wordpress.com/2012/08/helpkids1.png',
      'title':'title1',
      'colaboradores':327.0,
      'meta':500.0,
    },
    {
      'image':'https://justgive.files.wordpress.com/2012/08/helpkids1.png',
      'title':'title2',
      'colaboradores':250.0,
      'meta':520.0,
      }
  ];
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
              padding: EdgeInsets.only(top: 35, bottom: 10, right: 15, left: 15),
              child: Center(child: Text('Hola agente de cambio',style: TextStyle(fontSize: 20),)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
              child: Center(child: Text('Con solo 1.00 sol, puedes ayudar a muchas instituciones beneficas',style: TextStyle(fontSize: 16),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  height: 420.0,
                  child: ListView.builder(
                    itemCount: _data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = _data[index];
                        return Card1(
                          image: dato['image'],
                          title: dato['title'],
                          colaboradores: dato['colaboradores'],
                          meta: dato['meta'],
                          onTap: (){},
                        );
                    },
                    )
                ),
            ),
             const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 180,
                decoration:  BoxDecoration(
                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Envia regalo a de la comida')),
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 20),
              child: Text('¿No estas seguro de como ayudar?',style: TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 520,
                decoration:  BoxDecoration(
                          color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Informe de ayuda')),
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 20),
              child: Text('Juntos podemos ayudar a mas familias en necesidad',style: TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 520,
                decoration:  BoxDecoration(
                          color: Colors.amber,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Indice de ayuda')),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 180,
                decoration:  BoxDecoration(
                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Invita a tus amigos')),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 520,
                decoration:  BoxDecoration(
                          color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Conocenos')),
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 20),
              child: Text('Desglose de la ayuda',style: TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 180,
                decoration:  BoxDecoration(
                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                child: const Center(child: Text('Desgloce donacion')),
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
