import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    FirstTabContent(),
    SecondTabContent(),
    FirstTabContent(),
    SecondTabContent()
  ];

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
        ),
        BottomNavigationBarItem(
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
    var greenColor = Color(0xFF33AF85);
    var badgeColor = Color(0xFFFE7777);

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Home Page",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Stack(
                children: <Widget>[
                  Icon(
                    Icons.notifications,
                    color: greenColor,
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    width: 8,
                    height: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: badgeColor,
                        border: Border.all(color: Colors.white, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                    text: "Choose your course",
                    children: [
                      TextSpan(
                          style: TextStyle(
                              color: greenColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400),
                          text: " right away")
                    ]),
              )
            ],
          ),
          SizedBox(height: 16.0),
          SizedBox(
            height: 36,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.0,
                    ),
                    decoration: InputDecoration(
                        hintMaxLines: 1,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFF8FAFB),
                        hintText:
                            "Search for your grade, course, training type...",
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 12.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 16.0,
                        )),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.20,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              _getGridTile(
                  Color(0xFFFFC425),
                  Icon(
                    Icons.folder_special,
                    color: Colors.white,
                  ),
                  "Category"),
              _getGridTile(
                  Color(0xFF58D688),
                  Icon(Icons.play_circle_filled, color: Colors.white),
                  "Boutique class"),
              _getGridTile(Color(0xFF55B3FE),
                  Icon(Icons.assignment, color: Colors.white), "Free course"),
              _getGridTile(Color(0xFFFE7B7A),
                  Icon(Icons.store, color: Colors.white), "Bookstore"),
              _getGridTile(Color(0xFFB766F2),
                  Icon(Icons.videocam, color: Colors.white), "Live course"),
              _getGridTile(
                  Color(0xFF66DD4C),
                  Icon(Icons.airplanemode_active, color: Colors.white),
                  "Leaderboard"),
            ],
          )
        ],
      ),
    );
  }

  _getGridTile(Color color, Icon icon, String title) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Material(
              elevation: 5.0,
              type: MaterialType.circle,
              color: color,
              child: Center(
                child: icon,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}

class SecondTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
