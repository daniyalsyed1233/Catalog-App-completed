import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "cart".text.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            },
          ),
          // "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
          WidthBox(30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying Not Supported Yet".text.make()));
            },
            child: "Buy".text.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.backgroundColor),
                shape: MaterialStateProperty.all(StadiumBorder())),
          ).w32(context)
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.center.xl3.make()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying Not Supported Yet".text.make()));
              },
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  }

                  // {  _cart.remove(_cart.items[index]);
                  // setState(() {});},

                  ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
