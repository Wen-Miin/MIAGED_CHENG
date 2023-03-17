import 'package:cloud_firestore/cloud_firestore.dart';

class Carts {
  //String cartId;
  String name;
  String price;
  String size;
  String image;
  String brand;

  Carts(
      //this.cartId,
      this.image,
      this.brand,
      this.price,
      this.size,
      this.name);

  //définir liste
  final List<Carts> _carts = [];
  List listId = [];

  // récupérer la liste des éléments pour chaque élément de carts
  List<Carts> get carts => _carts;

  // Méthode pour créer une instance de Carts à partir d'un DocumentSnapshot Firestore
  static Carts cartsFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Carts(
      //data['id'],
      data['image'],
      data['marque'],
      data['price'],
      data['taille'],
      data['titre']
    );
  }

}
