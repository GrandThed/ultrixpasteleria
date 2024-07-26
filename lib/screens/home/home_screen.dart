import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/screens/home/widgets/pastry_card.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fba.FirebaseAuth auth = fba.FirebaseAuth.instance;
    const points = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(auth.currentUser?.displayName ?? "Usuario"),
        centerTitle: true,
        leading: Center(
            child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000), color: Colors.white),
          child: Center(
            child: Text(
              points > 99 ? "99+" : points.toString(),
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.w900),
            ),
          ),
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        PastryCard(item: pastryItemExample),
        PastryCard(item: pastryItemExample),
        PastryCard(item: pastryItemExample),
        PastryCard(item: pastryItemExample)
      ])),
    );
  }
}
