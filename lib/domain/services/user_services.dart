import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ultrixpasteleria/domain/models/user.dart';

class UserServices {
  static void writeUserData(String userId, Map<String, dynamic> data) {
    final db = FirebaseFirestore.instance;
    db.doc('users/$userId').set(data);
  }

  static Future<UserData> readUserData(String userId) async {
    final db = FirebaseFirestore.instance;
    final doc = await db.doc('users/$userId').get();
    if (doc.data() != null) {
      return UserData.fromJson(doc.data()!);
    } else {
      throw Error();
    }
  }
}
