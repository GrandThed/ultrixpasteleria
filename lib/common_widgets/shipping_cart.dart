import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/screens/cart/cart_screen.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      tooltip: 'Open shopping cart',
      onPressed: () {
        Navigator.pushNamed(context, CartScreen.routeName);
      },
    );
  }
}
