import 'package:ultrixpasteleria/domain/models/pastry_item.dart';

class CartListingItem {
  int? amount;
  PastryItem? pastryItem;
  CartListingItem({this.amount, pastryItem});
  setAmount(int newAmount) {
    amount = newAmount;
  }
}
