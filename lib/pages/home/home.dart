import 'package:ac/services/donation_1_supabase.dart';
import 'package:ac/services/donation_3_supabase.dart';
import 'package:ac/services/donation_4_supabase.dart';
import 'package:ac/services/donation_5_supabase.dart';
import 'package:ac/services/donationpost_supabase.dart';
import 'package:flutter/material.dart';
import 'package:ac/pages/home/index_home.dart';
import 'package:ac/widgets/home/index_widget_home.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  
  // ignore: prefer_final_fields
  
  final _pageController2 = PageController();
  final _currentPageNotifier2 = ValueNotifier<int>(0);
  final _boxHeight = 150.0;

  GlobalKey<PageContainerState> key = GlobalKey();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final DonationPostService = Provider.of<DonationPostSeresvice>(context);
    final DonationPostService3 = Provider.of<DonationPostSeresvice3>(context);
    final DonationPostService1 = Provider.of<DonationPostSeresvice1>(context);
    final datofinal =DonationPostService1.donationpost1s;
    final DonationPostService4 = Provider.of<DonationPostSeresvice4>(context);
    final DonationPostService5 = Provider.of<DonationPostSeresvice5>(context);
    print(DonationPostService4.donationpost4s.length);
    
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
        title: const Text('Hola agente de cambio',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromARGB(255, 180, 243, 212),
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
                    itemCount: DonationPostService.donationposts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = DonationPostService.donationposts[index];
                        return Card1(
                          image: dato.image,
                          title: dato.title,
                          colaboradores: dato.colaboradores,
                          meta: dato.meta,
                          personas: dato.personas,
                          donadores: dato.donadores,
                          onTap: (){
                             Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> SocialScreenHome(
                                postAsset:dato.image,
                                postTitle:dato.title,
                                postDescript:dato.description,
                                donationAmount:dato.meta,
                                donorsNumber:dato.donadores,
                                category:dato.subTitle,
                                img1: dato.img1,
                                img2: dato.img2,
                                img3: dato.img3,
                                url_share:dato.url
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
                    itemCount: DonationPostService4.donationpost4s.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = DonationPostService4.donationpost4s[index];
                        return Card3(
                          image: dato.image,
                          title: dato.title,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> SecreenHelp2(
                              youtubetext: dato.yotube,
                              postTitle: dato.title2,
                              description:dato.description,
                              datoimage:dato.imagenes
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
                    itemCount: DonationPostService3.donationpost3s.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = DonationPostService3.donationpost3s[index];
                        return Card4(
                          image: dato.image,
                          num1: dato.num1,
                          num2: dato.num2,
                          num3: dato.num3,
                          num4: dato.num4,
                          num5: dato.num5,
                          num6: dato.num6,
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
              onTap:()async{
                final urlPreview = 'https://www.youtube.com/watch?v=tLJaHH5MAfg';
                await Share.share('Ven y unete al cambio por el Perú\n\n$urlPreview');
              },
            ),
            const SizedBox(height: 30,),
            SizedBox(height: 530, 
              child: ListView.builder(
                    itemCount: DonationPostService5.donationpost5s.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {  
                      final dato = DonationPostService5.donationpost5s[index];
                        return Card3(
                          image: dato.image,
                          title: dato.title,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> SecreenHelp2(
                              youtubetext: dato.yotube,
                              postTitle: dato.title2,
                              description:dato.description,
                              datoimage:dato.imagenes
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
                  builder: (context)=> const BuySecurity(
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
                    itemCount: datofinal.length,
                    child: _buildPageView(_pageController2, _currentPageNotifier2, datofinal),
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
   _buildPageView(
          PageController pageController, ValueNotifier currentPageNotifier,List datofinal) =>
      PageView.builder(
          
          itemCount: datofinal.length,
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            final dato2 = datofinal[index]; 
            return Stack(
              children: [
                Container(
                  height: _boxHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                    ),
                  child: Stack(children: [
                    const Center(child: CircularProgressIndicator())
                  ],),
                ),
                Container(
                  height: _boxHeight,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(dato2.image),
                        fit: BoxFit.cover,
                      ),
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
                        child: Text(dato2.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
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
                                builder: (context)=> SecreenMore2(
                                    img:dato2.image,
                                    title:dato2.title,
                                    subtitle:dato2.subtitle,
                                    sub_title:dato2.sub_title,
                                    data:dato2.item6
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
                ),
              ],
            );
          },
          onPageChanged: (int index) {
            currentPageNotifier.value = index;
          });
}



  
