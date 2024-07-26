import 'package:ultrixpasteleria/domain/models/pastry_item.dart';

class CartListingItem {
  int? amount;
  PastryItem? pastryItem;
  CartListingItem({this.amount, this.pastryItem});
  setAmount(int newAmount) {
    amount = newAmount;
  }
}
