import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/navigation/tab_navigator.dart';

class Navigationbar extends StatefulWidget {
  @override
  State<Navigationbar> createState() => _NavigationbarState();
  final User user;
  const Navigationbar({required this.user});
}

class _NavigationbarState extends State<Navigationbar> {
  String _currentPage = "Opskrifter";
  List<String> pageKeys = ["Opskrifter", "Madplaner", "Favoritter"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Opskrifter": GlobalKey<NavigatorState>(),
    "Madplaner": GlobalKey<NavigatorState>(),
    "Favoritter": GlobalKey<NavigatorState>(),
  };
  
  int _selectedIndex = 0;

    late User _currentUser;  
    bool _isSigningOut = false;

    void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Opskrifter") {
            _selectTab("Opskrifter", 0);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Opskrifter"),
          _buildOffstageNavigator("Madplaner"),
          _buildOffstageNavigator("Favoritter"),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.food_bank_outlined),
              title: new Text('Opskrifter'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.format_list_bulleted_outlined),
              title: new Text('Madplaner'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.favorite_border),
              title: new Text('Favoritter'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        user: _currentUser,
      ),
    );
  }
}
