import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback toggleThemeMode;

  const AppbarWidget(
      {super.key, required this.isDarkMode, required this.toggleThemeMode});

  @override
  Widget build(BuildContext context) => AppBar(
        title: const Text(
          'First App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode
                  ? Icons.light_mode_sharp
                  : Icons.dark_mode_sharp,
            ),
            onPressed: toggleThemeMode,
            tooltip: "Toggle Theme",
          ),
          const IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: null,
            tooltip: "Search",
          ),
          const IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: null,
            tooltip: "More",
          ),
        ],
        backgroundColor: Colors.blueAccent,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}