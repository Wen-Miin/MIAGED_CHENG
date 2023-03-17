import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'cartPage.dart';
import 'homePage.dart';
import 'models/items.dart';
import 'models/users.dart';
import 'profilePage.dart';


class ItemDetails extends StatefulWidget {
  late final Items item;
  ItemDetails({required this.item});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late final Items item;
  int _selectedIndex = 0;
  late Users user;
  final CollectionReference _cartCollection = FirebaseFirestore.instance.collection('carts');
  late final String cartId;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Cart()));
        break;
      case 2:
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }

    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    //final CartId = 1;
    //Cart cart = cartsFunctions.getCartItems() as Cart;
    Cart cart = Cart();
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de l'article"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
      Center(
      child:
          Text('${item.name}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),),
          SizedBox(height: 10),
          Center(
          child:
          Image.network(item.image,height: 200,width: 200),),
          SizedBox(height: 10),
          Center(
          child:Text('Prix : ${item.price} €',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),),
          SizedBox(height: 10),
    Center(
    child:
          Text('Taille : ${item.size}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),),
          SizedBox(height: 10),
    Center(
    child:
          Text('Marque : ${item.brand}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),),
          SizedBox(height: 10),
    Center(
    child:
          ElevatedButton(
            onPressed: () async {
              await cart.addItemToCart(item.name, item.price, item.size, item.image, item.brand);
            },
            child: Text('Ajouter au panier'),
          ),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: _onItemTapped,
      ),
    );
  }

}
