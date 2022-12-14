import 'package:ac/route/index_page.dart';
import 'package:ac/screen/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class BottomNavBar extends StatefulWidget {
    BottomNavBar({
    Key? key,
  }) : super(key: key);


  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int selectedPos = 0;
  double bottomNavBarHeight = 45;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "",
      const Color.fromARGB(255, 21, 103, 99),
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.search,
      "",
      const Color.fromARGB(255, 21, 103, 99),
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.layers,
      "",
      const Color.fromARGB(255, 21, 103, 99),
    ),
    TabItem(
      Icons.perm_identity,
      "",
      const Color.fromARGB(255, 21, 103, 99),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: 10),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    Widget slogan;
    switch (selectedPos) {
      case 0:
        slogan = const HomeScrean();
        break;
      case 1:
        slogan = const CategoryScreen();
        break;
      case 2:
        slogan = const NavigationDonatio();
        break;
      case 3:
        slogan = PerfilScreen();
        break;
      default:
        slogan = const HomeScrean();
        break;
    }

    return GestureDetector(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: selectedColor,
          child: slogan),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value = _navigationController.value! + 1;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 500),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
