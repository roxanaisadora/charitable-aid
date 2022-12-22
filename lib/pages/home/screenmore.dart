import 'package:flutter/material.dart';

class SecreenMore extends StatelessWidget {
  const SecreenMore({super.key});

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
                      'https://portal.andina.pe/EDPfotografia/Thumbnail/2015/12/07/000328982W.jpg'),
                  fit: BoxFit.fill,
                ),
              ),

             ),
             SizedBox(height: 15),
             Text('Juntos por el cambio',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
             SizedBox(height: 25),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text('Con nuestra ayuda llegamos a donde los demas no llegan',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
             ),
             SizedBox(height: 15),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text('El área de asistencia social, acudió con ayuda a familias de pobreza y extrema pobreza, así como también aquellas familias que sufren los estragos de las fuertes lluvias, granizadas y friajes, que ocasionaron el derrumbe de sus viviendas. Este apoyo consta de productos de primera necesidad, alimentos; que fueron trasladados al centro poblado Atoshaico, y los caseríos de Lanchecucho, Ahijadero Lacamaca, Quinua Alta, Nogalpampa, Tambillo Alto, de igual forma en diferentes puntos de nuestra localidad como, Lucma Alta y Oxapampa.\nsiete mil voluntarios peruanos se unirán a otros tres mil voluntarios internacionales procedentes de 43 países de los cinco continentes para realizar una serie de actividades de apoyo comunitario en diez ciudades del Perú.\nArequipa, Piura, Trujillo, Chimbote, Lima, Callao, Iquitos, Tarapoto, Huancayo y Cusco serán las ciudades impactadas por este mega evento que está movilizando a más de 150 organizaciones de diferentes partes del mundo que se ha unido para realizar "Un Solo Perú".'),
             ),
          SizedBox(height: 25),
          ],
        ),
      ),
    );
    
  }
}