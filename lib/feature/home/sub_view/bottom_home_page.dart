import 'package:flutter/material.dart';
import 'package:online_shop/feature/home/home_view.dart';
import 'package:online_shop/feature/home/sub_view/bottom_nav_bar.dart';
import 'package:online_shop/product/constants/color_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _inactiveColor = ColorConstants.gray;
  final _activeColor = ColorConstants.primaryColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody(), bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text('Product'),
          activeColor: ColorConstants.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text(
            'Fav ',
          ),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Profile'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    final pages = [
      const HomeView(),
      Container(
        alignment: Alignment.center,
        child: const Text(
          'Users',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          'Messages',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
