import 'package:flutter/material.dart';

class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "IPhone 14 Pro",
        desc: "14th generation",
        price: 999,
        color: "#33505a",
        image: "assets/images/IP.png")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: 1,
        name: "IPhone 14 Pro",
        desc: "14th generation",
        price: 999,
        color: "#33505a",
        image: "assets/images/IP.png");
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
