import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/screens/home/widgets/pastry_card_add_unit.dart';

class PastryCard extends StatelessWidget {
  final PastryItem item;
  const PastryCard({
    required this.item,
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
        SizedBox(
          height: cardSize * 0.7,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
                fit: BoxFit.cover,
                "lib/assets/Gemini_Generated_Image_oz4ha1oz4ha1oz4h.jpeg"),
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
                      textAlign: TextAlign.left,
                      item.title ?? "Title",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      item.description ?? "Item",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const PastryCardAddUnit()
            ],
          ),
        )
      ]),
    );
  }
}
