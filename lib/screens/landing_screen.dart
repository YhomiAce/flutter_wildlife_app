import 'package:flutter/material.dart';
import 'package:shopping_app/app_utils/utilities.dart';
import 'package:shopping_app/screens/content_screen.dart';
import 'package:shopping_app/screens/gellery_screen.dart';
import 'package:shopping_app/screens/video_content_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _tabs = [
    ContentScreen(),
    VideoContentScreen(),
    GalleryScreen(),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorYellowAccent,
        unselectedItemColor: colorWhite,
        backgroundColor: colorBlack.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: 'Browse'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: 'Watch'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Gallery'),
        ],
        onTap: (index) {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
