import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final activityProvider = FutureProvider((ref) async {
  final db = FirebaseFirestore.instance;
  final querySnapshot = await db.collection("pastry").get();
  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.map((pastryDocs) {
      return PastryItem.fromJson(pastryDocs.data());
    });
  } else {
    throw Error();
  }
});
