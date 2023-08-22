import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog App".text.xl5.bold.color(context.accentColor).make(),
        "Trending Products".text.xl2.color(context.accentColor).make(),
      ],
    );
  }
}
