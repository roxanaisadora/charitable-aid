
import 'package:ac/route/index_page.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class NavigationDonatio extends StatelessWidget {
  const NavigationDonatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi lista de ayuda'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.greenAccent,

          child: ContainedTabBarView(
            tabs: const [
              Text('Donaciones'),
              Text('Ayuda social'),
            ],
            tabBarProperties: TabBarProperties(
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