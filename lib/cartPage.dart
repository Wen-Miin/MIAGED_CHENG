import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miaged/models/items.dart';
import 'package:miaged/profilePage.dart';
import 'homePage.dart';
import 'models/carts.dart';
import 'models/users.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
  List<Items> panier = [];
  late Users users;
  Cart();

  final CollectionReference _cartCollection =
      FirebaseFirestore.instance.collection('carts');

  Future<void> addItemToCart(String titre, String price, String taille,
      String image, String marque) async {
    _cartCollection.add({
      'image': image,
      'marque': marque,
      'price': price,
      'taille': taille,
      'titre': titre,
    });
    print(" Ajout dans firebase de => titre : $titre, price : $price, taille : $taille, image : $image, marque : $marque");
  }
}

class _CartState extends State<Cart> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 1;
  late Users user;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  double montantTotal = 0.0;
  //double montantTotal = panier.reduce((value, element) => value + element.price);

  //calculMontantTotal(){
  //  // Parcours de tous les éléments du tableau "panier[index].size"
  //  for (var element in panier[index].size) {
  //    // Ajout du prix de chaque élément à la variable cumulatrice
  //    montantTotal += element.prix;
  //  }
  //}

  Future<void> removeItemFromCart(int index) async {
    List<Items> panier = [];
    String itemId = panier[index].id;
    await FirebaseFirestore.instance
        .collection('carts')
        .doc(itemId)
        .delete();
    setState(() {
      //montantTotal -= panier[index].price;
      panier.removeAt(index);
    });
  }

  /*
  List<Map<String, dynamic>> cartItems = [
    //liste des vetements
  ];


  void removeItem(int index) {
    setState(() {
      totalAmount -= cartItems[index]['price'];
      cartItems.removeAt(index);
    });
  }

  Future<void> removeItemFromCart(String itemId) async {
    await _cartCollection.doc(cartId).update({
      'items': FieldValue.arrayRemove([itemId]),
    });
  }

    final total = cartItems.fold<num>(0, (sum, item) => sum + item['price']);

    // Affichage de la liste des vêtements dans le panier et du total général
  }
  */

  Widget build(BuildContext context) {
    //print(panier.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(children: [
        FutureBuilder<QuerySnapshot>(
          future: _firestore.collection('carts').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Une erreur est survenue : ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            List panier = snapshot.data!.docs
                .map((doc) => Carts.cartsFromSnapshot(doc))
                .toList();
            return
              Container(
                height: MediaQuery.of(context).size.height*0.75,
                padding: EdgeInsets.all(10),
                child : ListView.builder(
              itemCount: panier.length,
              itemBuilder: (BuildContext context, int index)  {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(panier[index].image),
                  ),
                  title: Text(panier[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text('Marque: ${panier[index].brand}'),
                      Text('Taille: ${panier[index].size}'),
                      Text('Prix: ${panier[index].price}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => removeItemFromCart(index),
                  ),
                );
              },
            ),);
          },
        ),
        Container(
          //height: MediaQuery.of(context).size.height,
          //padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Montant total :',
                style: TextStyle(fontSize: 20),
              ),

              Text(
                '$montantTotal €',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        )
      ]),
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
