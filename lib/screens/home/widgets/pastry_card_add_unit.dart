import 'package:flutter/material.dart';

class PastryCardAddUnit extends StatefulWidget {
  const PastryCardAddUnit({
    super.key,
  });

  @override
  State<PastryCardAddUnit> createState() => _PastryCardAddUnitState();
}

class _PastryCardAddUnitState extends State<PastryCardAddUnit> {
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
