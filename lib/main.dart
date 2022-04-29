import 'package:bottomnnavigator/favoritos.dart';
import 'package:bottomnnavigator/perfil.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      primarySwatch: Colors.green,
      accentColor: Colors.pink,
    ),
  ));
}

class Home extends StatefulWidget {



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedScreenIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {'title': 'Perfil do Murilou', 'screen': perfil()},
    {'title': 'Favoritos do Murilo', 'screen': favoritos()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'],
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.person),
              label: 'perfil'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'favoritos'),
        ],
      ),
    );
  }
}

/*
void _toggleFavorite(Meal meal){
  setState((){
    _favoriteMeals.contains(meal)
        ? _favoriteMeals.remove(meal)
        : _favoriteMeals.add(meal);
  });
}*/

/*floatingActionButton: FloatingActionButton(
child Icon(isFavorite(meal) ? Icons.star :Icons.star_border),
onPressed(){
  onToggleFavorite(meal);
},
),*/
