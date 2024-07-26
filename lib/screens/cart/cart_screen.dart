import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/screens/cart/widgets/cart_listing.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Your Shopping Cart"),
      ),
      body: Column(
        children: const [
          Expanded(child: CartListing()),
        ],
      ),
    );
  }
}
