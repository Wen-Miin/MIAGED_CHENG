import 'package:flutter/cupertino.dart';

class Item {
  final String name;
  final double price;
  final AssetImage image;
  final String size;


  Item({
    required this.name,
    required this.price,
    required this.size,
    required this.image,
  });
}
