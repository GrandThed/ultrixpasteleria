import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/screens/cart/widgets/cart_listing_add_unit.dart';

class CartListing extends StatelessWidget {
  const CartListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = [pastryItemExample, pastryItemExample, pastryItemExample];
    return ListView(
      children: [
        ...list.map(
          (pastry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.asset(
                  "lib/assets/Gemini_Generated_Image_oz4ha1oz4ha1oz4h.jpeg"),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pastry.title ?? "Name"),
                    Text("${(pastry.price ?? 0) / 100}\$")
                  ]),
              trailing: const CartListingAddUnit(),
            ),
          ),
        ),
        const ElevatedButton(onPressed: null, child: Text("buy"))
      ],
    );
  }
}
