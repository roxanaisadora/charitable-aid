

import 'package:ac/pages/home/index_home.dart';
import 'package:ac/widgets/home/index_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  // ignore: prefer_final_fields
  List<dynamic> _data = [];
  List<dynamic>  _items = [];
  List<dynamic>  _items2 = [];
  List<dynamic>  _items3 = [];
  List<dynamic>  _items4 = [];
  Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/json/listhome.json');
  final data = await json.decode(response);
    setState(() {
      _data = data["items"];
      _items = data["items_1"];
      _items2 = data["items_2"];
      _items3 = data["items_3"];
      _items4 = data["items_4"];
    });
  }
  
  final _pageController2 = PageController();
  final _currentPageNotifier2 = ValueNotifier<int>(0);
  final _boxHeight = 150.0;

  GlobalKey<PageContainerState> key = GlobalKey();

  int counter = 0;

   @override
  void initState() {
    super.initState();
    readJson();
    // loadData().then((value) => catalogdata=value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
        title: const Text('Hola agente de cambio',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.greenAccent,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
           
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
              child: Center(child: Text('Con solo 1.00 sol, puedes ayudar a muchas instituciones beneficas',style: TextStyle(fontSize: 16),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  height: 500.0,
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
                          personas: dato['personas'],
                          donadores: dato['donadores'],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> SocialScreenHome(
                                postAsset:dato['image'],
                                postTitle:dato['title'],
                                postDescript:dato['description'],
                                donationAmount:dato['donation'],
                                donorsNumber:dato['colaboradores'].toInt(),
                                category:dato['category'],
                              ),
                              ),
                            );
                          },
                        );
                    },
                    )
                ),
            ),
             const SizedBox(height: 20,),
            Card2(
              image: 'assets/image/regalo_1.png',
              title: 'Envia regalo a de la comida',
              subtitle: 'En nombre de tus seres queridos',
              titleb: 'Enviar regalo',
              onTap:(){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const Secreen2(
                  ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 20),
              child: Text('¿No estas seguro de como ayudar?',style: TextStyle(fontSize: 16),),
            ),
            SizedBox(height: 530, 
              child: ListView.builder(
                    itemCount: _items2.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = _items2[index];
                        return Card3(
                          image: dato['image'],
                          title: dato['title'],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> const SecreenHelp(
                            ),
                            ),
                          );
                          }
                        );
                    },
                    )
              ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 20),
              child: Text('Juntos podemos ayudar a mas familias en necesidad',style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
            ),
           SizedBox(height: 560, 
              child: ListView.builder(
                    itemCount: _items3.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = _items3[index];
                        return Card4(
                          image: dato['image'],
                          num1: dato['num1'],
                          num2: dato['num2'],
                          num3: dato['num3'],
                          num4: dato['num4'],
                          num5: dato['num5'],
                          num6: dato['num6'],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> const SecreenMore(
                            ),
                            ),
                          );
                          }
                        );
                    },
                    )
              ),
            const SizedBox(height: 30,),
            Card2(
              image: 'assets/image/amigos.jpg',
              title: 'Invita a tus amigos',
              subtitle: 'Y luchen juntos contra el hambre',
              titleb: 'Invita a amigos',
              onTap:(){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const Secreen2(
                  ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30,),
            SizedBox(height: 530, 
              child: ListView.builder(
                    itemCount: _items4.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = _items4[index];
                        return Card3(
                          image: dato['image'],
                          title: dato['title'],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> const SecreenHelp(
                            ),
                            ),
                          );
                          }
                        );
                    },
                    )
              ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 20),
              child: Text('Desglose de la ayuda',style: TextStyle(fontSize: 16),),
            ),
            Card2(
              image: 'assets/image/estadistica.png',
              title: 'Como se Utiliza mi donación',
              subtitle: 'Conoce hacerca del uso de tu ayuda',
              titleb: 'Aprende mas',
              onTap:(){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const Secreen2(
                  ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 180.0,
                  child: ArrowPageIndicator(
                    isJump: true,
                    leftIcon: Image.asset(
                      "assets/image/left-arrow.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                    rightIcon: Image.asset(
                      "assets/image/right-arrow.png",
                      width:25.0,
                      height:25.0,
                    ),
                    pageController: _pageController2,
                    currentPageNotifier: _currentPageNotifier2,
                    itemCount: _items.length,
                    child: _buildPageView(_pageController2, _currentPageNotifier2),
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
   _buildPageView(
          PageController pageController, ValueNotifier currentPageNotifier) =>
      PageView.builder(
          itemCount: _items.length,
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            final dato2 = _items[index];
            return Container(
              height: _boxHeight,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(dato2['image']),
                    fit: BoxFit.cover,
                  ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)),
              child:Stack(
               children: [
                    Container(
                      decoration:  BoxDecoration(
                        color: const  Color.fromARGB(255, 23, 23, 23).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top:10),
                    child: Text(dato2['title'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 15),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> const SecreenHelp(
                            ),
                            ),
                          );
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(child: Text('Leer mas',style: TextStyle(color: Colors.white, fontSize: 17))),
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              )
               ], 
              )
            );
          },
          onPageChanged: (int index) {
            currentPageNotifier.value = index;
          });
}



  
