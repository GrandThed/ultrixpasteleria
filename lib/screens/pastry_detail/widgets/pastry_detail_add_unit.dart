import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/domain/providers/cart_provider.dart';

class PastryDetailAddUnit extends ConsumerWidget {
  final PastryItem pastryItem;
  const PastryDetailAddUnit({
    required this.pastryItem,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(cartProvider).getAmountFromPastryItem(pastryItem);
    if (amount == 0) {
      return IconButton(
        onPressed: () {
          ref.read(cartProvider).increaseAmountFromPastryItem(pastryItem);
        },
        icon: const Icon(Icons.add),
      );
    } else {
      return Row(children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            ref.read(cartProvider).increaseAmountFromPastryItem(pastryItem);
          },
        ),
        Text(amount.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            ref.read(cartProvider).increaseAmountFromPastryItem(pastryItem);
          },
        ),
      ]);
    }
  }
}
