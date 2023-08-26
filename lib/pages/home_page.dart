import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/Cart.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '';
import 'package:flutter_catalog/models/catalog.dart';

import '../home_widgets/catalog_list.dart';
import '../home_widgets/catalog_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var proudctsData = decodeData["products"];
    CatalogModel.items = List.from(proudctsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context
          .canvasColor, //-Theme.of(context).cardColor(if your are not using velcoityX )
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartroute),
          backgroundColor: context.backgroundColor,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ).badge(color: Colors.red, size: 20, count: _cart.items.length),
      ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().py16().centered(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
