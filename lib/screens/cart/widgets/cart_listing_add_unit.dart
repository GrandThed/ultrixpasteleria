import 'package:flutter/material.dart';

class CartListingAddUnit extends StatefulWidget {
  const CartListingAddUnit({
    super.key,
  });

  @override
  State<CartListingAddUnit> createState() => _CartListingAddUnitState();
}

class _CartListingAddUnitState extends State<CartListingAddUnit> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    if (amount == 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 46),
        child: IconButton(
          onPressed: () => setState(() {
            amount += 1;
          }),
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
