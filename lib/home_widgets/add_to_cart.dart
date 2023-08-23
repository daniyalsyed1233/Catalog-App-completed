import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/Cart.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ??
        false; //agar is cart ke andar jo items vo contain karta hai widget.catalog to true rehga otherwise flase
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          AddMutation(catalog);
          // _cart.add(catalog);
          // _cart.catalog =
          // _catalog; // set kara taki mapping kaam kare jo cart.dart me kari hai
          // setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : "Add to Cart".text.make(),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.backgroundColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
