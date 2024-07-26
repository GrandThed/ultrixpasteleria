import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/domain/providers/cart_provider.dart';

class CartListingAddUnit extends ConsumerStatefulWidget {
  final PastryItem pastryItem;
  const CartListingAddUnit({
    required this.pastryItem,
    super.key,
  });

  @override
  ConsumerState<CartListingAddUnit> createState() => _CartListingAddUnitState();
}

class _CartListingAddUnitState extends ConsumerState<CartListingAddUnit> {
  @override
  Widget build(BuildContext context) {
    final amount =
        ref.watch(cartProvider).getAmountFromPastryItem(widget.pastryItem);
    if (amount == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 46),
        child: IconButton(
          onPressed: () {
            ref
                .read(cartProvider)
                .increaseAmountFromPastryItem(widget.pastryItem);
          },
          icon: const Icon(Icons.add),
        ),
      );
    } else {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              ref
                  .read(cartProvider)
                  .decreaseAmountFromPastryItem(widget.pastryItem);
            }),
        Text(amount.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            ref
                .read(cartProvider)
                .increaseAmountFromPastryItem(widget.pastryItem);
          },
        ),
      ]);
    }
  }
}
