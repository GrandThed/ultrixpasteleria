import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListingAddUnit extends ConsumerStatefulWidget {
  const CartListingAddUnit({
    super.key,
  });

  @override
  ConsumerState<CartListingAddUnit> createState() => _CartListingAddUnitState();
}

class _CartListingAddUnitState extends ConsumerState<CartListingAddUnit> {
  int amount = 0;

  @override
  void initState() {
    setState(() {
      // amount = cartProvider.getAmountFromPastryItem(item);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (amount == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 46),
        child: IconButton(
          onPressed: () {
            setState(() {
              amount += 1;
            });
          },
          icon: const Icon(Icons.add),
        ),
      );
    } else {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => setState(() {
            amount -= 1;
          }),
        ),
        Text(amount.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => setState(() {
            amount += 1;
          }),
        ),
      ]);
    }
  }
}
