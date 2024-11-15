import 'package:flutter/material.dart';

import '../../common/common_functions.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Baraa Ahmad AbuAlrob',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            createDrawerList(
              context,
              Icons.account_circle,
              'Account',
            ),
            createDrawerList(
              context,
              Icons.home,
              'Home',
            ),
            createDrawerList(
              context,
              Icons.shopping_cart,
              'Cart',
            ),
            createDrawerList(
              context,
              Icons.payment,
              'Payment',
            ),
            createDrawerList(
              context,
              Icons.local_offer,
              'Offers',
            ),
            createDrawerList(
              context,
              Icons.settings,
              'Settings',
            ),
            createDrawerList(
              context,
              Icons.info,
              'About us',
            ),
          ],
        ),
      );

  Widget createDrawerList(
    BuildContext context,
    IconData icon,
    String title,
  ) =>
      ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
        ),
        onTap: () {
          Navigator.of(
            context,
          ).pop();
          showSnackBar(
            context,
            "$title tapped!",
          );
        },
      );
}
