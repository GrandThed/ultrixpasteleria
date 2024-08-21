import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/common_widgets/shipping_cart.dart';
import 'package:ultrixpasteleria/domain/models/pastry_item.dart';
import 'package:ultrixpasteleria/domain/providers/pastry_provider.dart';
import 'package:ultrixpasteleria/domain/providers/user_data_provider.dart';
import 'package:ultrixpasteleria/screens/home/widgets/pastry_card.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fba.FirebaseAuth auth = fba.FirebaseAuth.instance;
    return Scaffold(
      drawer: Drawer(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                auth.currentUser?.displayName ?? "name",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                "Total Points Accumulated: ",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () => auth.signOut(),
                    child: Text("Sign Out",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      appBar: AppBar(
        title: Text(auth.currentUser?.displayName ?? "User"),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return const PointsCounter();
        }),
        actions: const [
          ShoppingCart(),
        ],
      ),
      body: const ActivityView(),
    );
  }
}

class PointsCounter extends ConsumerWidget {
  const PointsCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsyncValue = ref.watch(userDataProvider);
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Center(
          child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000), color: Colors.white),
        child: Center(
          child: userDataAsyncValue.when(
              data: (data) => Text(
                    (data.points ?? 0) > 99
                        ? "99+"
                        : (data.points ?? 0).toString(),
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w900),
                  ),
              error: (_, __) => const Text(
                    "0",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w900),
                  ),
              loading: () => const Text(
                    "0",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w900),
                  )),
        ),
      )),
    );
  }
}

class ActivityView extends ConsumerWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(pastlyProvider);
    return RefreshIndicator(
      onRefresh: () => ref.refresh(pastlyProvider.future),
      child: ListView(
        children: [
          activity.when(
            data: (data) {
              return SingleChildScrollView(
                  child: Column(children: [
                ...data.map((pastry) => PastryCard(pastry: pastry)),
              ]));
            },
            error: (error, stackTrace) => const Text("Error :("),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
