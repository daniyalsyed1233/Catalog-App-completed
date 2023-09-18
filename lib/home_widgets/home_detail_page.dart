// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50)
          ],
        ).p32(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.asset(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30,
                    edge: VxEdge.top,
                    arcType: VxArcType.convey,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            catalog.name.text.xl4
                                .color(context.accentColor)
                                .lg
                                .bold
                                .make(),
                            SizedBox(
                              height: 10,
                            ),
                            catalog.desc.text
                                .textStyle(context.captionStyle)
                                .xl
                                .center
                                .color(context.accentColor)
                                .make(),
                            10.heightBox,
                            "Catalog's mission statement is “to be Earth's most customer-centric company.” The company's vision statement is “to be earth's most customer-centric company; to build a place where people can come to find and discover anything they might want to buy online."
                                .text
                                .center
                                .color(context.accentColor)
                                .make()
                          ],
                        ).p64(),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
