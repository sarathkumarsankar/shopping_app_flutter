import 'package:flutter/material.dart';
import 'package:shopping_app/shopping_cart.dart';
import 'package:shopping_app/shopping_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  final List<Widget> pages = [
    const ShoppingListPage(),
    const ShoppingCartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: selectedIndex, children: pages),
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 35,
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedItemColor: Theme.of(context).primaryColor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "")
            ]
            )
            );
  }
}
