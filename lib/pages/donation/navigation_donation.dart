import 'package:ac/route/index_page.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:provider/provider.dart';

class NavigationDonatio extends StatelessWidget {
  const NavigationDonatio({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpService = Provider.of<HelpSeresvice>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(126, 105, 240, 175),
        title: const Text('Mi lista de ayuda'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color:const Color.fromARGB(126, 105, 240, 175),
          child: ContainedTabBarView(
            tabs: [
              const Text('Donaciones'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text('Ayuda social'),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 30),
                  onPressed: () {
                    HelpService.listarHelp2();
                  },
                  icon: const Icon(Icons.refresh))
                
              ],),
            ],
            tabBarProperties: const TabBarProperties(
              height: 32.0,
              indicatorColor: Colors.blue,
              indicatorWeight: 4.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
            ),
            views: const [
              PrductoHome(),
              HelpSocial(),
            ],
            onChange: (index) => print(index),
          ),
        ),
      ),
    );
  }
}
