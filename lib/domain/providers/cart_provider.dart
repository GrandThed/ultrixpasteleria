import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/models/cart_listing_item.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';

class CartNotifier extends ChangeNotifier {
  List<CartListingItem> cartListingItems = [];

  void changeAmount(PastryItem pastryItem, int amount) {
    final existingCartListingItemIndex = cartListingItems.indexWhere(
        (cartListingItem) => cartListingItem.pastryItem?.id == pastryItem.id);
    if (existingCartListingItemIndex != -1) {
      cartListingItems[existingCartListingItemIndex].setAmount(amount);
    } else {
      cartListingItems = [
        ...cartListingItems,
        CartListingItem(amount: amount, pastryItem: pastryItem)
      ];
    }
    notifyListeners();
  }

  void increaseAmountFromPastryItem(PastryItem pastryItem) {
    final existingCartListingItemIndex = cartListingItems.indexWhere(
        (cartListingItem) => cartListingItem.pastryItem?.id == pastryItem.id);
    if (existingCartListingItemIndex != -1) {
      cartListingItems[existingCartListingItemIndex].setAmount(
          (cartListingItems[existingCartListingItemIndex].amount ?? 0) + 1);
    } else {
      cartListingItems = [
        ...cartListingItems,
        CartListingItem(amount: 1, pastryItem: pastryItem)
      ];
    }
    notifyListeners();
  }

  void decreaseAmountFromPastryItem(PastryItem pastryItem) {
    final existingCartListingItemIndex = cartListingItems.indexWhere(
        (cartListingItem) => cartListingItem.pastryItem?.id == pastryItem.id);
    if (existingCartListingItemIndex != -1) {
      if (cartListingItems[existingCartListingItemIndex].amount! > 0) {
        cartListingItems[existingCartListingItemIndex].setAmount(
            cartListingItems[existingCartListingItemIndex].amount! - 1);
      }
    } else {
      cartListingItems = [
        ...cartListingItems,
        CartListingItem(amount: 0, pastryItem: pastryItem)
      ];
    }
    notifyListeners();
  }

  int getAmountFromPastryItem(PastryItem pastryItem) {
    final existingCartListingItemIndex = cartListingItems.indexWhere(
        (cartListingItem) => cartListingItem.pastryItem?.id == pastryItem.id);
    if (existingCartListingItemIndex != -1) {
      return cartListingItems[existingCartListingItemIndex].amount ?? 0;
    } else {
      return 0;
    }
  }
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});
