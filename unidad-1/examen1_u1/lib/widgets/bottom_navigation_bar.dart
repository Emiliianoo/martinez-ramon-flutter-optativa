import 'package:flutter/material.dart';
import 'package:examen1_u1/widgets/cart_details.dart';
import 'package:examen1_u1/widgets/productos_page.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 0;

  final List<Widget> screens = const [ProductosPage(), CartDetails()];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carritos'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}
