import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/providers/cart_provider.dart';
import 'package:ultrixpasteleria/screens/cart/cart_screen.dart';

class ShoppingCart extends ConsumerWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(cartProvider).getTotalAmount();
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
      child: Stack(
        children: <Widget>[
          const IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          amount <= 0
              ? Container()
              : Positioned(
                  right: 6,
                  bottom: 10,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,
                          size: 20.0, color: Colors.green[800]),
                      Positioned(
                          bottom: 3.0,
                          left: amount > 9 ? 3 : 7.0,
                          child: Center(
                            child: Text(
                              amount > 9 ? "+9" : amount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
        ],
      ),
    );
    // return IconButton(
    //   icon: const Icon(Icons.shopping_cart),
    //   tooltip: 'Open shopping cart',
    //   onPressed: () {
    //     Navigator.pushNamed(context, CartScreen.routeName);
    //   },
    // );
  }
}
