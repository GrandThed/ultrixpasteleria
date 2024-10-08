import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/screens/home/widgets/pastry_card_add_unit.dart';
import 'package:ultrixpasteleria/screens/pastry_detail/pastry_detail_screen.dart';

class PastryCard extends StatelessWidget {
  final PastryItem pastry;
  const PastryCard({
    required this.pastry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const cardSize = 400.0;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(
              context, PastryDetailScreen.routeName,
              arguments: pastry),
          child: SizedBox(
            height: cardSize * 0.7,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Hero(
                tag: "${pastry.id ?? "unique"}-image",
                child: Image.network(fit: BoxFit.cover, pastry.image!),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, PastryDetailScreen.routeName,
                      arguments: pastry),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        pastry.title ?? "Title",
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        pastry.description ?? "Item",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              PastryCardAddUnit(
                pastryItem: pastry,
              )
            ],
          ),
        )
      ]),
    );
  }
}
