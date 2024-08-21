import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/models/cart_listing_item.dart';
import 'package:ultrixpasteleria/domain/models/user.dart';
import 'package:ultrixpasteleria/domain/providers/user_data_provider.dart';
import 'package:ultrixpasteleria/domain/services/user_services.dart';

final buyProvider =
    StateNotifierProvider<CondominioNotifier, AsyncValue<UserData?>>((ref) {
  return CondominioNotifier(ref);
});

class CondominioNotifier extends StateNotifier<AsyncValue<UserData?>> {
  CondominioNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> buy(List<CartListingItem> cartListingItemsToBuy) async {
    state = const AsyncValue.data(null);

    try {
      // calculate how many points they would win
      final wonPoints = _calculateBuyPoints(cartListingItemsToBuy);
      // get user current data
      final currentUserData = ref.read(userDataProvider);
      // save the user data
      currentUserData.whenData((data) async {
        // invalidate current user data provider
        ref.invalidate(userDataProvider);
        // return the new data as AsyncValue
        state = ref.read(userDataProvider);
        await UserServices.writeUserData(
            data.id,
            UserData(id: data.id, points: (data.points ?? 0) + wonPoints)
                .toJson());
      });
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  int _calculateBuyPoints(List<CartListingItem> cartListingItemsToBuy) {
    return cartListingItemsToBuy.fold(
        0, (total, cartListingItem) => (cartListingItem.amount ?? 0) + total);
  }
}
