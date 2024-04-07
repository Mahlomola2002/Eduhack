import 'package:app/pages/Home.dart';
import 'package:app/pages/profile.dart';
import 'package:app/pages/updates.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPageIndex = 0;
  late String selectedPage;
  final List<Widget> options = [
    HomePage(),
    UniversityNewsPage(),
    StudentProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    selectedPage = 'Home';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 241, 240, 241),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            switch (index) {
              case 0:
                selectedPage = 'Home';
                break;
              case 1:
                selectedPage = 'Updates';
                break;
              case 2:
                selectedPage = 'Profile';
                break;
            }
          });
        },
        indicatorColor: Color.fromARGB(255, 122, 221, 208),
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(FluentIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.news),
            label: 'Updates',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.profile_search),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(child: options[currentPageIndex]),
    );
  }
}
