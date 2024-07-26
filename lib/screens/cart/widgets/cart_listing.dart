import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/providers/cart_provider.dart';
import 'package:ultrixpasteleria/screens/cart/widgets/cart_listing_add_unit.dart';

class CartListing extends ConsumerWidget {
  const CartListing({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartListing = ref
        .watch(cartProvider)
        .cartListingItems
        .where((cartListing) => (cartListing.amount ?? 0) > 0);
    return ListView(
      children: [
        ...cartListing.map(
          (cartListingItem) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.network(cartListingItem.pastryItem?.image ?? ""),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartListingItem.pastryItem?.title ?? "Name"),
                    Text("${(cartListingItem.pastryItem?.price ?? 0) / 100}\$")
                  ]),
              trailing:
                  CartListingAddUnit(pastryItem: cartListingItem.pastryItem!),
            ),
          ),
        ),
        const ElevatedButton(onPressed: null, child: Text("buy"))
      ],
    );
  }
}
