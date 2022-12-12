

import 'package:ac/providers/provider_donation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrductoHome extends StatelessWidget {
  const PrductoHome({super.key});

   @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<ProductoProvider>(context);
    productoData.queryAll();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mis donaciones'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productoData.deleteAll();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Container(
        color: Colors.greenAccent,
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
      ),
    );
  }
}