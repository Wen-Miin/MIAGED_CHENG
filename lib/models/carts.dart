import 'package:cloud_firestore/cloud_firestore.dart';

class Carts {
  final String name;
  final String price;
  final String size;
  final String image;
  final String brand;

  Carts(
      this.image,
      this.brand,
      this.price,
      this.size,
      this.name);

  //définir liste
  final List<Carts> _carts = [];

  // récupérer la liste des éléments pour chaque élément de carts
  List<Carts> get carts => _carts;


  // Méthode pour créer une instance de Carts à partir d'un DocumentSnapshot Firestore
  static Carts cartsFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Carts(
      data['image'],
      data['marque'],
      data['price'],
      data['taille'],
      data['titre']
    );
  }

}
