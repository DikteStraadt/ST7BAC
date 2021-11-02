import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/pages/favorites_page.dart';
import 'package:flutter_project_1_0/pages/plans_page.dart';
import 'package:flutter_project_1_0/pages/recipes_page.dart';

class NavigationController extends StatefulWidget {
  @override
  _NavigationControllerState createState() => _NavigationControllerState();
  const NavigationController({Key? key, required this.initpage})
      : super(key: key);

  final int initpage;
}

class _NavigationControllerState extends State<NavigationController> {
  PageController _controller = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.initpage);
    _selectedIndex = widget.initpage;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.food_bank_outlined),
            label: 'Opskrifter',
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.format_list_bulleted_outlined),
              label: 'Madplaner'),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite_border),
            label: 'Favoritter',
          ),
        ],
        onTap: _onTappedBar,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
      ),
      body: PageView(
        controller: _controller,
        children: [
          RecipesPage(),
          PlanPage(),
          FavoritesPage(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _controller.jumpToPage(value);
  }
}

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
// }
