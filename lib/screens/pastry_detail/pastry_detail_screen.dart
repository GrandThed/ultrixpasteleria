import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/common_widgets/shipping_cart.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/screens/pastry_detail/widgets/pastry_detail_add_unit.dart';

class PastryDetailScreen extends StatelessWidget {
  static const routeName = '/pastry_detail';
  const PastryDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pastry = ModalRoute.of(context)!.settings.arguments as PastryItem;
    const cardSize = 400.0;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ShoppingCart(),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(pastry.title ?? "title"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(
          height: cardSize * 0.7,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: "${pastry.id ?? "unique"}-image",
                child: Image.network(fit: BoxFit.cover, pastry.image!),
              ),
              Positioned.directional(
                bottom: 10,
                end: 10,
                textDirection: TextDirection.ltr,
                child: Container(
                  color: Colors.white,
                  child: PastryDetailAddUnit(pastryItem: pastry),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pastry.description ?? "Item",
                    ),
                    const SizedBox(height: 30),
                    Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            "nutrient",
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                          TableCell(
                              child: Text(
                            "value (in grams)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ))
                        ]),
                        ...pastry.nutritionalValue!
                            .map((nutrient) => TableRow(children: [
                                  TableCell(
                                      child: Text(nutrient.name ?? "nutrient")),
                                  TableCell(
                                      child: Text(nutrient.value != null
                                          ? ("${nutrient.value!}g")
                                          : "value"))
                                ]))
                            .toList()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
