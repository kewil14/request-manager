import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenuWrapper extends StatefulWidget {
  const MainMenuWrapper({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainMenuWrapper> createState() => _MainHomeWrapperState();
}

class _MainHomeWrapperState extends State<MainMenuWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _goBranch,
        // selectedItemColor: AppColors.primary,
        // unselectedItemColor: AppColors.lightGray,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_rounded),
            icon: Icon(Icons.home_outlined),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.assured_workload_sharp),
            icon: Icon(Icons.assured_workload_outlined),
            label: 'Requete',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.edit_document),
            icon: Icon(Icons.edit_document),
            label: 'Ressources',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_rounded),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
