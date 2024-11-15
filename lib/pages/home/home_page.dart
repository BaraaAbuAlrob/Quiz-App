import 'package:flutter/material.dart';

import 'home_widgets/body_widget.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleThemeMode;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.toggleThemeMode,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppbarWidget(
      //   isDarkMode: widget.isDarkMode,
      //   toggleThemeMode: widget.toggleThemeMode,
      // ),
      // drawer: const DrawerWidget(),
      body: SafeArea(
        child: BodyWidget(
          isDarkMode: widget.isDarkMode,
          toggleThemeMode: widget.toggleThemeMode,
        ),
      )
      // bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
