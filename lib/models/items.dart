import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  String id;
  String name;
  String price;
  String size;
  String image;
  String brand;

  Items(
      this.id,
      this.name,
      this.price,
      this.size,
      this.image,
      this.brand);

  //définir liste
  final List<Items> _items = [];

  // récupérer la liste des éléments pour chaque item
  List<Items> get items => _items;


  // Méthode pour créer une instance de Items à partir d'un DocumentSnapshot Firestore
  static Items fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Items(
      data['id'],
      data['titre'],
      data['price'],
      data['taille'],
      data['image'],
      data['marque'],
    );
  }

}
