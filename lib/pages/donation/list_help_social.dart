

// ignore_for_file: unnecessary_new

import 'package:ac/providers/provider_donation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpSocial extends StatelessWidget {
  const HelpSocial({super.key});

   @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<ProductoProvider>(context);
    productoData.queryAll();
    return Container(
        color: Colors.greenAccent,
        child: Container(
          child:  productoData.product.isEmpty ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ven y comienza a ayudar', style: TextStyle(fontSize: 30),),
            Image.network('https://www.pngkit.com/png/detail/237-2376444_donate-png-hd-donation.png'),
          ],
        ) : Stack(
          alignment: Alignment.topRight,
          children: [
            InkWell(onTap: () {  },child: Container(width: 140, height: 50,child: Row(
              children: [
                const Text('Eliminar todo'),
                IconButton(
            onPressed: () {
              productoData.deleteAll();
            },
            icon: const Icon(Icons.delete),
          ),
              ],
            ),),),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ListView.builder(
          itemCount: productoData.product.length,
          itemBuilder: (BuildContext context, int index) {
              final data = productoData.product[index];
              return Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('${data.nombre} | ${data.categoria} '),
                    subtitle: Text('S/. ${data.precio} '),
                      trailing: IconButton(
                        onPressed: () {
                          productoData.delete(data.id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {},
                  ),
                ),
              );
          },
          ),
            ),]
        )
          ),
      );
  }
}