import 'package:flutter/material.dart';

class PastryDetailAddUnit extends StatefulWidget {
  const PastryDetailAddUnit({
    super.key,
  });

  @override
  State<PastryDetailAddUnit> createState() => _PastryDetailAddUnitState();
}

class _PastryDetailAddUnitState extends State<PastryDetailAddUnit> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    if (amount == 0) {
      return IconButton(
        onPressed: () => setState(() {
          amount += 1;
        }),
        icon: const Icon(Icons.add),
      );
    } else {
      return Row(children: [
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
