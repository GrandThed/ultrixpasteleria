import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/common_widgets/shipping_cart.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/domain/providers/pastry_provider.dart';
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
        title: Text(auth.currentUser?.displayName ?? "User"),
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
        actions: const [
          ShoppingCart(),
        ],
      ),
      body: ActivityView(),
    );
  }
}

class ActivityView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pull to refresh')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(activityProvider.future),
        child: ListView(
          children: [
            activity.when(
              data: (data) {
                return SingleChildScrollView(
                    child: Column(children: [
                  PastryCard(item: pastryItemExample),
                ]));
              },
              error: (error, stackTrace) => const Text("Error :("),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
