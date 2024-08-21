import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ultrixpasteleria/domain/models/user.dart';

class UserServices {
  static Future<void> writeUserData(
      String userId, Map<String, dynamic> data) async {
    final db = FirebaseFirestore.instance;
    await db.doc('users/$userId').set(data);
  }

  static Future<UserData> readUserData(String userId) async {
    final db = FirebaseFirestore.instance;
    final doc = await db.doc('users/$userId').get();
    if (doc.data() != null) {
      return UserData.fromJson(doc.data()!, userId);
    } else {
      await writeUserData(userId, {});
      return UserData.fromJson(
          (await db.doc('users/$userId').get()).data()!, userId);
    }
  }
}
