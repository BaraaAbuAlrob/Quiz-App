import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Cart',
            tooltip: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
            ),
            label: 'Payment',
            tooltip: 'Payment',
          ),
        ],
        currentIndex: 0,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
      );
}