import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;

final userDataProvider = FutureProvider.autoDispose((ref) async {
  try {
    final fba.FirebaseAuth auth = fba.FirebaseAuth.instance;
    final userData = await UserServices.readUserData(auth.currentUser!.uid);
    ref.keepAlive();
    return userData;
  } catch (e) {
    rethrow;
  }
});
