import 'package:ac/widgets/home/card6.dart';
import 'package:flutter/material.dart';

class BuySecurity extends StatelessWidget {
  const BuySecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const Text('Nosotros', style: TextStyle(fontSize: 25),textAlign: TextAlign.start),
              const SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  CardBuy(
                    title:'Nuestro objetivo',
                    description: 'Trabajamos para brindar ayuda alas intituciones o familias que requieran de apoyo con vivieres, trabajo social o donaciones monetarias, el objetivo de ayudar, apoyar y atender sus urgencias a personas de bajos recursos en todo el Perú.',
                    image: Image.asset('assets/image/metas.png', fit: BoxFit.fill)
                  ),
                  const SizedBox(height: 10,),
                  CardBuy(
                    title:'Que Donar',
                    description: 'El apoyo es de todo tipo de donaciones como: muebles, artefactos, ropa, calzados, juguetes, utensilios de cocina, aparatos electrónicos, etc',
                    image: Image.asset('assets/image/caja-sorpresa.png', fit: BoxFit.fill)
                  ),
                  const SizedBox(height: 10,),
                  CardBuy(
                    title:'Como ayudamos',
                    description: 'Gracias a las donaciones de familias y empresas solidarias podemos seguir con nuestras Acciones Sociales, a través de una entrevista personal, por lo tanto creemos que es nuestra responsabilidad preocuparnos por el bienestar de nuestra Comunidad.',
                    image: Image.asset('assets/image/cuidado.png', fit: BoxFit.fill)
                  ),
                  const SizedBox(height: 10,),
                  CardBuy(
                    title:'Aquien ayudamos',
                    description: 'TEstamos apoyando directamente a personas de bajos recursos con la entrega de silla de ruedas, muletas, pañales, ropa, etc., a los comedores populares con entrega de víveres y brindamos un puesto de trabajo a jóvenes de nuestra comunidad.',
                    image: Image.asset('assets/image/friendship.png', fit: BoxFit.fill)
                  ),

                  const SizedBox(height: 30,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}