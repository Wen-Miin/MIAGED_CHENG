import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Cart'),
    Text('User'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Item> _items = [
    Item(
      name: 'Chemise',
      price: 10.0,
      image: AssetImage('assets/images/chemise.png'),
    ),
    Item(
      name: 'Robe',
      price: 20.0,
      image: AssetImage('assets/images/dress.png'),
    ),
    Item(
      name: 'Jeans',
      price: 30.0,
      image: AssetImage('assets/images/jeans.png'),
    ),
    Item(
      name: 'Jupe',
      price: 40.0,
      image: AssetImage('assets/images/skirt.png'),
    ),
    Item(
      name: 'Chaussures Vans',
      price: 50.0,
      image: AssetImage('assets/images/vans.png'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acheter'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: _items[index].image,
            ),
            title: Text(_items[index].name),
            subtitle: Text('\€${_items[index].price}'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Item {
  final String name;
  final double price;
  final AssetImage image;

  Item({
    required this.name,
    required this.price,
    required this.image,
  });
}
