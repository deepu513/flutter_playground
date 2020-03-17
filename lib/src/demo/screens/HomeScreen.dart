import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [FirstTabContent(), SecondTabContent(), FirstTabContent(), SecondTabContent()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: _getBottomNavBar(),
    );
  }

  _getBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: Text('Subject'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.nature),
          title: Text('Growing'),
        ), BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('My'),
        ),
      ],
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

}

class FirstTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SecondTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}